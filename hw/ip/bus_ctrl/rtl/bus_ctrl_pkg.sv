// Copyright lowRISC contributors.
// Licensed under the Apache License; Version 2.0; see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Author: Dino Mehmedagić

package bus_ctrl_pkg;
  localparam int N_MASTER = 1;    // number of masters that can be restricted by this module
  localparam int N_SLAVE = 19;
  localparam int N_SLAVE_PERI = 29;
  localparam int MASTER_REG_END     = top_pkg::TL_DW - N_MASTER;
  localparam int SLAVE_REG_END      = top_pkg::TL_DW - N_SLAVE;
  localparam int SLAVE_PERI_REG_END = top_pkg::TL_DW - N_SLAVE_PERI;
  localparam int TOTAL_IPS          = N_MASTER + N_SLAVE;

  //typedef logic [N_MASTER-1:0] master_bits_t;
  //typedef logic [N_SLAVE-1:0] slave_bits_t;

  typedef struct packed { // all masters except main core, dm
    logic untrusted_m;
  } master_bits_t;

  typedef struct packed { // all slaves on main crossbar except bus_ctrl
    logic rom_ctrl_rom;
    logic debug_mem;
    logic ram_main;
    logic eflash;
    logic rom_ctrl_regs;
  //  logic peri;
    logic flash_ctrl_core;
    logic flash_ctrl_prim;
    logic aes;
    logic entropy_src;
    logic csrng;
    logic edn0;
    logic edn1;
    logic hmac;
    logic rv_plic;
    logic otbn;
    logic keymgr;
    logic kmac;
    logic sram_ctrl_main;
    logic untrusted_s;
  } slave_bits_t;

  typedef struct packed { // all slaves on peripheral crossbar
    logic uart0;
    logic uart1;
    logic uart2;
    logic uart3;
    logic spi_host0;
    logic spi_host1;
    logic spi_device;
    logic usbdev;
    logic gpio;
    logic i2c0;
    logic i2c1;
    logic i2c2;
    logic pwm_aon;
    logic adc_ctrl_aon;
    logic ast_io;
    logic rstmgr_aon;
    logic clkmgr_aon;
    logic pwrmgr_aon;
    logic rv_timer;
    logic alert_handler;
    logic aon_timer_aon;
    logic otp_ctrl;
    logic lc_ctrl;
    logic ram_ret_aon;
    logic sram_ctrl_ret_aon;
    logic sensor_ctrl_aon;
    logic pattgen;
    logic sysrst_ctrl_aon;
    logic pinmux_aon;
  } slave_bits_peri_t;

  typedef enum logic [1:0] { // states for FSM
    IDLE     = 2'b00,
    ACK      = 2'b01,
    ACK_ERR  = 2'b10
  } bus_ctrl_state_t;

endpackage : bus_ctrl_pkg
