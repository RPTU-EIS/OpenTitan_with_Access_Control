// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Software running on the untrusted device's internal memory

// Author: Dino Mehmedagić

#include "sw/device/lib/arch/device.h"
#include "sw/device/lib/base/mmio.h"
#include "sw/device/lib/dif/dif_gpio.h"
#include "sw/device/lib/dif/dif_uart.h"
#include "sw/device/lib/flash_ctrl.h"
#include "sw/device/lib/pinmux.h"
#include "sw/device/lib/runtime/hart.h"
#include "sw/device/lib/runtime/log.h"
#include "sw/device/lib/runtime/print.h"
#include "sw/device/lib/testing/check.h"
#include "sw/device/lib/testing/test_status.h"

#include "hw/top_earlgrey/sw/autogen/top_earlgrey.h"  // Generated.

#define INTERRUPT_HANDLER_ABI __attribute__((aligned(4), interrupt))

static dif_uart_t uart1;

//Fast interrupt of highest priority. This will cause the peripheral device to read orders from the main core
INTERRUPT_HANDLER_ABI void _handler_irq_fast(void) {
  // Read the sent message from the main core
  mmio_region_t slave_adapter = mmio_region_from_addr(TOP_EARLGREY_UNTRUSTED_CORE_BASE_ADDR);
  uint32_t rcv_char = mmio_region_read32(slave_adapter, 0);

  // Send an ack response to the main core
  mmio_region_t main_core = mmio_region_from_addr(TOP_EARLGREY_MAIN_CORE_BASE_ADDR);
  uint32_t unused_char = mmio_region_read32(main_core, 0);
  unused_char--; // do something with variable; otherwise compiler is mad

  // Display results
  LOG_INFO("MAIN CORE SENT: %c", rcv_char);
}

void _boot_start(void) {
  CHECK(
      dif_uart_init(
          (dif_uart_params_t){
              .base_addr = mmio_region_from_addr(TOP_EARLGREY_UART1_BASE_ADDR),
          },
          &uart1) == kDifUartOk,
      "failed to init UART1");
  CHECK(dif_uart_configure(&uart1,
                           (dif_uart_config_t){
                               .baudrate = kUartBaudrate,
                               .clk_freq_hz = kClockFreqPeripheralHz,
                               .parity_enable = kDifUartToggleDisabled,
                               .parity = kDifUartParityEven,
                           }) == kDifUartConfigOk,
        "failed to configure UART");
  base_uart_stdout(&uart1);

  usleep(80*1000); // Wait for the UART to configure?
  LOG_INFO("Hart 1 ready to break integrity!");
  uint32_t i = 0;
  while (true) {
    LOG_INFO("%d", i++);
  }
}
