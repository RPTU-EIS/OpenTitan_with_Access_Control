// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

#include "sw/device/examples/demos.h"
#include "sw/device/lib/arch/device.h"
#include "sw/device/lib/dif/dif_uart.h"
#include "sw/device/lib/pinmux.h"
#include "sw/device/lib/runtime/hart.h"
#include "sw/device/lib/runtime/log.h"
#include "sw/device/lib/runtime/print.h"
#include "sw/device/lib/testing/check.h"
#include "sw/device/lib/testing/test_status.h"
#include "sw/device/lib/base/mmio.h"

#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"  // Generated.

void configure_bus_ctrl(dif_uart_t *uart) {
  mmio_region_t master_cfg_reg = mmio_region_from_addr(TOP_EARLGREY_BUS_CTRL_BASE_ADDR);
  mmio_region_t slave_peri_cfg_reg = mmio_region_from_addr(TOP_EARLGREY_BUS_CTRL_BASE_ADDR + 0x200);
  while (true) {
    size_t chars_available;
    if (dif_uart_rx_bytes_available(uart, &chars_available) != kDifUartOk ||
        chars_available == 0) {
      break;
    }
    uint8_t rcv_char;
    CHECK(dif_uart_bytes_receive(uart, 1, &rcv_char, NULL) == kDifUartOk);
    CHECK(dif_uart_byte_send_polled(uart, rcv_char) == kDifUartOk);
    switch (rcv_char) {
        case '0'  : mmio_region_write32(master_cfg_reg, 0, (uint32_t) 0x00000000);
                    break;
        case '1'  : mmio_region_write32(master_cfg_reg, 0, (uint32_t) 0x80000000);
                    break;
        case '2'  : mmio_region_write32(slave_peri_cfg_reg, 0, (uint32_t) 0x00000000);
                    break;
        case '3'  : mmio_region_write32(slave_peri_cfg_reg, 0, (uint32_t) 0x40000000);
                    break;
        case 'h'  : LOG_INFO("0 - untrusted core in the default environment.");
                    LOG_INFO("1 - untrusted core in the secure environment.");
                    LOG_INFO("2 - UART 1 in the default environment.");
                    LOG_INFO("3 - UART 1 in the secure environment.");
                    break;
    }
  }
}

/* void bus_ctrl_init() {
  mmio_region_t master_cfg_reg = mmio_region_from_addr(TOP_EARLGREY_BUS_CTRL_BASE_ADDR);
  mmio_region_t slave_cfg_reg = mmio_region_from_addr(TOP_EARLGREY_BUS_CTRL_BASE_ADDR + 0x100);
  mmio_region_t slave_peri_cfg_reg = mmio_region_from_addr(TOP_EARLGREY_BUS_CTRL_BASE_ADDR + 0x200);
  mmio_region_write32(master_cfg_reg, 0, (uint32_t) 0x00000000);
  mmio_region_write32(slave_cfg_reg, 0, (uint32_t) 0x00000000);
  mmio_region_write32(slave_peri_cfg_reg, 0, (uint32_t) 0x00000000);
} */

int main(int argc, char **argv) {

  dif_uart_t uart;
  CHECK(
      dif_uart_init(
          (dif_uart_params_t){
              .base_addr = mmio_region_from_addr(TOP_EARLGREY_UART0_BASE_ADDR),
          },
          &uart) == kDifUartOk);
  CHECK(dif_uart_configure(&uart, (dif_uart_config_t){
                                      .baudrate = kUartBaudrate,
                                      .clk_freq_hz = kClockFreqPeripheralHz,
                                      .parity_enable = kDifUartToggleDisabled,
                                      .parity = kDifUartParityEven,
                                  }) == kDifUartConfigOk);
  base_uart_stdout(&uart);

  pinmux_init();
 // bus_ctrl_init();

  // Add DATE and TIME because I keep fooling myself with old versions
  LOG_INFO("Test the bus control!");
  LOG_INFO("Built at: " __DATE__ ", " __TIME__);
  LOG_INFO("Let's test the bus control mechanism. Type one of the options ('h' for help):");
  
  while (true) {
    configure_bus_ctrl(&uart);    
  }
}
