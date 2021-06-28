// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0
//
// Register Top module auto-generated by `reggen`

`include "prim_assert.sv"

module rom_ctrl_regs_reg_top (
  input clk_i,
  input rst_ni,

  input  tlul_pkg::tl_h2d_t tl_i,
  output tlul_pkg::tl_d2h_t tl_o,
  // To HW
  output rom_ctrl_reg_pkg::rom_ctrl_regs_reg2hw_t reg2hw, // Write
  input  rom_ctrl_reg_pkg::rom_ctrl_regs_hw2reg_t hw2reg, // Read

  // Integrity check errors
  output logic intg_err_o,

  // Config
  input devmode_i // If 1, explicit error return for unmapped register access
);

  import rom_ctrl_reg_pkg::* ;

  localparam int AW = 7;
  localparam int DW = 32;
  localparam int DBW = DW/8;                    // Byte Width

  // register signals
  logic           reg_we;
  logic           reg_re;
  logic [AW-1:0]  reg_addr;
  logic [DW-1:0]  reg_wdata;
  logic [DBW-1:0] reg_be;
  logic [DW-1:0]  reg_rdata;
  logic           reg_error;

  logic          addrmiss, wr_err;

  logic [DW-1:0] reg_rdata_next;

  tlul_pkg::tl_h2d_t tl_reg_h2d;
  tlul_pkg::tl_d2h_t tl_reg_d2h;

  // incoming payload check
  logic intg_err;
  tlul_cmd_intg_chk u_chk (
    .tl_i,
    .err_o(intg_err)
  );

  logic intg_err_q;
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      intg_err_q <= '0;
    end else if (intg_err) begin
      intg_err_q <= 1'b1;
    end
  end

  // integrity error output is permanent and should be used for alert generation
  // register errors are transactional
  assign intg_err_o = intg_err_q | intg_err;

  // outgoing integrity generation
  tlul_pkg::tl_d2h_t tl_o_pre;
  tlul_rsp_intg_gen #(
    .EnableRspIntgGen(1),
    .EnableDataIntgGen(1)
  ) u_rsp_intg_gen (
    .tl_i(tl_o_pre),
    .tl_o
  );

  assign tl_reg_h2d = tl_i;
  assign tl_o_pre   = tl_reg_d2h;

  tlul_adapter_reg #(
    .RegAw(AW),
    .RegDw(DW),
    .EnableDataIntgGen(0)
  ) u_reg_if (
    .clk_i,
    .rst_ni,

    .tl_i (tl_reg_h2d),
    .tl_o (tl_reg_d2h),

    .we_o    (reg_we),
    .re_o    (reg_re),
    .addr_o  (reg_addr),
    .wdata_o (reg_wdata),
    .be_o    (reg_be),
    .rdata_i (reg_rdata),
    .error_i (reg_error)
  );

  assign reg_rdata = reg_rdata_next ;
  assign reg_error = (devmode_i & addrmiss) | wr_err | intg_err;

  // Define SW related signals
  // Format: <reg>_<field>_{wd|we|qs}
  //        or <reg>_{wd|we|qs} if field == 1 or 0
  logic alert_test_wd;
  logic alert_test_we;
  logic fatal_alert_cause_checker_error_qs;
  logic fatal_alert_cause_integrity_error_qs;
  logic [31:0] digest_0_qs;
  logic [31:0] digest_1_qs;
  logic [31:0] digest_2_qs;
  logic [31:0] digest_3_qs;
  logic [31:0] digest_4_qs;
  logic [31:0] digest_5_qs;
  logic [31:0] digest_6_qs;
  logic [31:0] digest_7_qs;
  logic [31:0] exp_digest_0_qs;
  logic [31:0] exp_digest_1_qs;
  logic [31:0] exp_digest_2_qs;
  logic [31:0] exp_digest_3_qs;
  logic [31:0] exp_digest_4_qs;
  logic [31:0] exp_digest_5_qs;
  logic [31:0] exp_digest_6_qs;
  logic [31:0] exp_digest_7_qs;

  // Register instances
  // R[alert_test]: V(True)

  prim_subreg_ext #(
    .DW    (1)
  ) u_alert_test (
    .re     (1'b0),
    .we     (alert_test_we),
    .wd     (alert_test_wd),
    .d      ('0),
    .qre    (),
    .qe     (reg2hw.alert_test.qe),
    .q      (reg2hw.alert_test.q),
    .qs     ()
  );


  // R[fatal_alert_cause]: V(False)

  //   F[checker_error]: 0:0
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_fatal_alert_cause_checker_error (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.fatal_alert_cause.checker_error.de),
    .d      (hw2reg.fatal_alert_cause.checker_error.d),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (fatal_alert_cause_checker_error_qs)
  );


  //   F[integrity_error]: 1:1
  prim_subreg #(
    .DW      (1),
    .SWACCESS("RO"),
    .RESVAL  (1'h0)
  ) u_fatal_alert_cause_integrity_error (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.fatal_alert_cause.integrity_error.de),
    .d      (hw2reg.fatal_alert_cause.integrity_error.d),

    // to internal hardware
    .qe     (),
    .q      (),

    // to register interface (read)
    .qs     (fatal_alert_cause_integrity_error_qs)
  );



  // Subregister 0 of Multireg digest
  // R[digest_0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_0 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[0].de),
    .d      (hw2reg.digest[0].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[0].q),

    // to register interface (read)
    .qs     (digest_0_qs)
  );

  // Subregister 1 of Multireg digest
  // R[digest_1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_1 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[1].de),
    .d      (hw2reg.digest[1].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[1].q),

    // to register interface (read)
    .qs     (digest_1_qs)
  );

  // Subregister 2 of Multireg digest
  // R[digest_2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_2 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[2].de),
    .d      (hw2reg.digest[2].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[2].q),

    // to register interface (read)
    .qs     (digest_2_qs)
  );

  // Subregister 3 of Multireg digest
  // R[digest_3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_3 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[3].de),
    .d      (hw2reg.digest[3].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[3].q),

    // to register interface (read)
    .qs     (digest_3_qs)
  );

  // Subregister 4 of Multireg digest
  // R[digest_4]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_4 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[4].de),
    .d      (hw2reg.digest[4].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[4].q),

    // to register interface (read)
    .qs     (digest_4_qs)
  );

  // Subregister 5 of Multireg digest
  // R[digest_5]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_5 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[5].de),
    .d      (hw2reg.digest[5].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[5].q),

    // to register interface (read)
    .qs     (digest_5_qs)
  );

  // Subregister 6 of Multireg digest
  // R[digest_6]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_6 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[6].de),
    .d      (hw2reg.digest[6].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[6].q),

    // to register interface (read)
    .qs     (digest_6_qs)
  );

  // Subregister 7 of Multireg digest
  // R[digest_7]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_digest_7 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.digest[7].de),
    .d      (hw2reg.digest[7].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.digest[7].q),

    // to register interface (read)
    .qs     (digest_7_qs)
  );



  // Subregister 0 of Multireg exp_digest
  // R[exp_digest_0]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_0 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[0].de),
    .d      (hw2reg.exp_digest[0].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[0].q),

    // to register interface (read)
    .qs     (exp_digest_0_qs)
  );

  // Subregister 1 of Multireg exp_digest
  // R[exp_digest_1]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_1 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[1].de),
    .d      (hw2reg.exp_digest[1].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[1].q),

    // to register interface (read)
    .qs     (exp_digest_1_qs)
  );

  // Subregister 2 of Multireg exp_digest
  // R[exp_digest_2]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_2 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[2].de),
    .d      (hw2reg.exp_digest[2].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[2].q),

    // to register interface (read)
    .qs     (exp_digest_2_qs)
  );

  // Subregister 3 of Multireg exp_digest
  // R[exp_digest_3]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_3 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[3].de),
    .d      (hw2reg.exp_digest[3].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[3].q),

    // to register interface (read)
    .qs     (exp_digest_3_qs)
  );

  // Subregister 4 of Multireg exp_digest
  // R[exp_digest_4]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_4 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[4].de),
    .d      (hw2reg.exp_digest[4].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[4].q),

    // to register interface (read)
    .qs     (exp_digest_4_qs)
  );

  // Subregister 5 of Multireg exp_digest
  // R[exp_digest_5]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_5 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[5].de),
    .d      (hw2reg.exp_digest[5].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[5].q),

    // to register interface (read)
    .qs     (exp_digest_5_qs)
  );

  // Subregister 6 of Multireg exp_digest
  // R[exp_digest_6]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_6 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[6].de),
    .d      (hw2reg.exp_digest[6].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[6].q),

    // to register interface (read)
    .qs     (exp_digest_6_qs)
  );

  // Subregister 7 of Multireg exp_digest
  // R[exp_digest_7]: V(False)

  prim_subreg #(
    .DW      (32),
    .SWACCESS("RO"),
    .RESVAL  (32'h0)
  ) u_exp_digest_7 (
    .clk_i   (clk_i),
    .rst_ni  (rst_ni),

    // from register interface
    .we     (1'b0),
    .wd     ('0),

    // from internal hardware
    .de     (hw2reg.exp_digest[7].de),
    .d      (hw2reg.exp_digest[7].d),

    // to internal hardware
    .qe     (),
    .q      (reg2hw.exp_digest[7].q),

    // to register interface (read)
    .qs     (exp_digest_7_qs)
  );




  logic [17:0] addr_hit;
  always_comb begin
    addr_hit = '0;
    addr_hit[ 0] = (reg_addr == ROM_CTRL_ALERT_TEST_OFFSET);
    addr_hit[ 1] = (reg_addr == ROM_CTRL_FATAL_ALERT_CAUSE_OFFSET);
    addr_hit[ 2] = (reg_addr == ROM_CTRL_DIGEST_0_OFFSET);
    addr_hit[ 3] = (reg_addr == ROM_CTRL_DIGEST_1_OFFSET);
    addr_hit[ 4] = (reg_addr == ROM_CTRL_DIGEST_2_OFFSET);
    addr_hit[ 5] = (reg_addr == ROM_CTRL_DIGEST_3_OFFSET);
    addr_hit[ 6] = (reg_addr == ROM_CTRL_DIGEST_4_OFFSET);
    addr_hit[ 7] = (reg_addr == ROM_CTRL_DIGEST_5_OFFSET);
    addr_hit[ 8] = (reg_addr == ROM_CTRL_DIGEST_6_OFFSET);
    addr_hit[ 9] = (reg_addr == ROM_CTRL_DIGEST_7_OFFSET);
    addr_hit[10] = (reg_addr == ROM_CTRL_EXP_DIGEST_0_OFFSET);
    addr_hit[11] = (reg_addr == ROM_CTRL_EXP_DIGEST_1_OFFSET);
    addr_hit[12] = (reg_addr == ROM_CTRL_EXP_DIGEST_2_OFFSET);
    addr_hit[13] = (reg_addr == ROM_CTRL_EXP_DIGEST_3_OFFSET);
    addr_hit[14] = (reg_addr == ROM_CTRL_EXP_DIGEST_4_OFFSET);
    addr_hit[15] = (reg_addr == ROM_CTRL_EXP_DIGEST_5_OFFSET);
    addr_hit[16] = (reg_addr == ROM_CTRL_EXP_DIGEST_6_OFFSET);
    addr_hit[17] = (reg_addr == ROM_CTRL_EXP_DIGEST_7_OFFSET);
  end

  assign addrmiss = (reg_re || reg_we) ? ~|addr_hit : 1'b0 ;

  // Check sub-word write is permitted
  always_comb begin
    wr_err = (reg_we &
              ((addr_hit[ 0] & (|(ROM_CTRL_REGS_PERMIT[ 0] & ~reg_be))) |
               (addr_hit[ 1] & (|(ROM_CTRL_REGS_PERMIT[ 1] & ~reg_be))) |
               (addr_hit[ 2] & (|(ROM_CTRL_REGS_PERMIT[ 2] & ~reg_be))) |
               (addr_hit[ 3] & (|(ROM_CTRL_REGS_PERMIT[ 3] & ~reg_be))) |
               (addr_hit[ 4] & (|(ROM_CTRL_REGS_PERMIT[ 4] & ~reg_be))) |
               (addr_hit[ 5] & (|(ROM_CTRL_REGS_PERMIT[ 5] & ~reg_be))) |
               (addr_hit[ 6] & (|(ROM_CTRL_REGS_PERMIT[ 6] & ~reg_be))) |
               (addr_hit[ 7] & (|(ROM_CTRL_REGS_PERMIT[ 7] & ~reg_be))) |
               (addr_hit[ 8] & (|(ROM_CTRL_REGS_PERMIT[ 8] & ~reg_be))) |
               (addr_hit[ 9] & (|(ROM_CTRL_REGS_PERMIT[ 9] & ~reg_be))) |
               (addr_hit[10] & (|(ROM_CTRL_REGS_PERMIT[10] & ~reg_be))) |
               (addr_hit[11] & (|(ROM_CTRL_REGS_PERMIT[11] & ~reg_be))) |
               (addr_hit[12] & (|(ROM_CTRL_REGS_PERMIT[12] & ~reg_be))) |
               (addr_hit[13] & (|(ROM_CTRL_REGS_PERMIT[13] & ~reg_be))) |
               (addr_hit[14] & (|(ROM_CTRL_REGS_PERMIT[14] & ~reg_be))) |
               (addr_hit[15] & (|(ROM_CTRL_REGS_PERMIT[15] & ~reg_be))) |
               (addr_hit[16] & (|(ROM_CTRL_REGS_PERMIT[16] & ~reg_be))) |
               (addr_hit[17] & (|(ROM_CTRL_REGS_PERMIT[17] & ~reg_be)))));
  end

  assign alert_test_we = addr_hit[0] & reg_we & !reg_error;
  assign alert_test_wd = reg_wdata[0];

  // Read data return
  always_comb begin
    reg_rdata_next = '0;
    unique case (1'b1)
      addr_hit[0]: begin
        reg_rdata_next[0] = '0;
      end

      addr_hit[1]: begin
        reg_rdata_next[0] = fatal_alert_cause_checker_error_qs;
        reg_rdata_next[1] = fatal_alert_cause_integrity_error_qs;
      end

      addr_hit[2]: begin
        reg_rdata_next[31:0] = digest_0_qs;
      end

      addr_hit[3]: begin
        reg_rdata_next[31:0] = digest_1_qs;
      end

      addr_hit[4]: begin
        reg_rdata_next[31:0] = digest_2_qs;
      end

      addr_hit[5]: begin
        reg_rdata_next[31:0] = digest_3_qs;
      end

      addr_hit[6]: begin
        reg_rdata_next[31:0] = digest_4_qs;
      end

      addr_hit[7]: begin
        reg_rdata_next[31:0] = digest_5_qs;
      end

      addr_hit[8]: begin
        reg_rdata_next[31:0] = digest_6_qs;
      end

      addr_hit[9]: begin
        reg_rdata_next[31:0] = digest_7_qs;
      end

      addr_hit[10]: begin
        reg_rdata_next[31:0] = exp_digest_0_qs;
      end

      addr_hit[11]: begin
        reg_rdata_next[31:0] = exp_digest_1_qs;
      end

      addr_hit[12]: begin
        reg_rdata_next[31:0] = exp_digest_2_qs;
      end

      addr_hit[13]: begin
        reg_rdata_next[31:0] = exp_digest_3_qs;
      end

      addr_hit[14]: begin
        reg_rdata_next[31:0] = exp_digest_4_qs;
      end

      addr_hit[15]: begin
        reg_rdata_next[31:0] = exp_digest_5_qs;
      end

      addr_hit[16]: begin
        reg_rdata_next[31:0] = exp_digest_6_qs;
      end

      addr_hit[17]: begin
        reg_rdata_next[31:0] = exp_digest_7_qs;
      end

      default: begin
        reg_rdata_next = '1;
      end
    endcase
  end

  // Unused signal tieoff

  // wdata / byte enable are not always fully used
  // add a blanket unused statement to handle lint waivers
  logic unused_wdata;
  logic unused_be;
  assign unused_wdata = ^reg_wdata;
  assign unused_be = ^reg_be;

  // Assertions for Register Interface
  `ASSERT_PULSE(wePulse, reg_we)
  `ASSERT_PULSE(rePulse, reg_re)

  `ASSERT(reAfterRv, $rose(reg_re || reg_we) |=> tl_o.d_valid)

  `ASSERT(en2addrHit, (reg_we || reg_re) |-> $onehot0(addr_hit))

  // this is formulated as an assumption such that the FPV testbenches do disprove this
  // property by mistake
  //`ASSUME(reqParity, tl_reg_h2d.a_valid |-> tl_reg_h2d.a_user.chk_en == tlul_pkg::CheckDis)

endmodule
