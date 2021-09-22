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

void send_uart_input(dif_uart_t *uart, mmio_region_t address) {
  while (true) {
    size_t chars_available;
    if (dif_uart_rx_bytes_available(uart, &chars_available) != kDifUartOk ||
        chars_available == 0) {
      break;
    }
    uint8_t rcv_char;
    CHECK(dif_uart_bytes_receive(uart, 1, &rcv_char, NULL) == kDifUartOk);
    CHECK(dif_uart_byte_send_polled(uart, rcv_char) == kDifUartOk);
    mmio_region_write32(address, 0, (uint32_t) rcv_char);
  }
}

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

  // Add DATE and TIME because I keep fooling myself with old versions
  LOG_INFO("Test the slave!");
  LOG_INFO("Built at: " __DATE__ ", " __TIME__);
  LOG_INFO("Let's test the slave functionality of the added core. Type a character to send:");
  
  mmio_region_t untrusted_core = mmio_region_from_addr(TOP_EARLGREY_UNTRUSTED_CORE_BASE_ADDR);
  while (true) {
    //usleep(10 * 1000);  // 10 ms
    send_uart_input(&uart, untrusted_core);    
  }
}
