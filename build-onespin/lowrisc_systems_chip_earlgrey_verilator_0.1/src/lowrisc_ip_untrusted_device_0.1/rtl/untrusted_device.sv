// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

/**
 * A modified rv_core_ibex wrapper. Contains an Ibex core with internal ROM for fetching
 * instructions, as well as RAM for processing data. It also contains a slave adapter which
 * allows it to send slave TL-UL messages to the master core.
 */
module untrusted_device #(
  parameter bit                 PMPEnable             = 1'b0,
  parameter int unsigned        PMPGranularity        = 0,
  parameter int unsigned        PMPNumRegions         = 4,
  parameter int unsigned        MHPMCounterNum        = 10,
  parameter int unsigned        MHPMCounterWidth      = 32,
  parameter bit                 RV32E                 = 0,
  parameter ibex_pkg::rv32m_e   RV32M                 = ibex_pkg::RV32MSingleCycle,
  parameter ibex_pkg::rv32b_e   RV32B                 = ibex_pkg::RV32BNone,
  parameter ibex_pkg::regfile_e RegFile               = ibex_pkg::RegFileFF,
  parameter bit                 BranchTargetALU       = 1'b1,
  parameter bit                 WritebackStage        = 1'b1,
  parameter bit                 ICache                = 1'b0,
  parameter bit                 ICacheECC             = 1'b0,
  parameter bit                 BranchPredictor       = 1'b0,
  parameter bit                 DbgTriggerEn          = 1'b1,
  parameter bit                 SecureIbex            = 1'b0,
  parameter int unsigned        DmHaltAddr            = 32'h1A110800,
  parameter int unsigned        DmExceptionAddr       = 32'h1A110808,
  parameter bit                 PipeLine              = 1'b0,
  parameter                     UntrustedRomBootFile  = ""
) (
  // Clock and Reset
  input  logic        clk_i,
  input  logic        rst_ni,
  // Clock domain for escalation receiver
  input  logic        clk_esc_i,
  input  logic        rst_esc_ni,

  input  prim_ram_1p_pkg::ram_1p_cfg_t ram_cfg_i,

  input  logic [31:0] hart_id_i,
  input  logic [31:0] boot_addr_i,

  // Data memory interface
  output tlul_pkg::tl_h2d_t     tl_d_o,
  input  tlul_pkg::tl_d2h_t     tl_d_i,

  // Slave interface
  output tlul_pkg::tl_d2h_t     tl_s_o,
  input  tlul_pkg::tl_h2d_t     tl_s_i,

  // Interrupt inputs
  input  logic        irq_software_i,
  input  logic        irq_timer_i,
  input  logic        irq_external_i,

  // Escalation input for NMI
  input  prim_esc_pkg::esc_tx_t esc_tx_i,
  output prim_esc_pkg::esc_rx_t esc_rx_o,

  // Debug Interface
  input  logic        debug_req_i,

  // Crash dump information
  output ibex_pkg::crash_dump_t crash_dump_o,

  // CPU Control Signals
  input lc_ctrl_pkg::lc_tx_t lc_cpu_en_i,
  input lc_ctrl_pkg::lc_tx_t pwrmgr_cpu_en_i,
  output logic        core_sleep_o,

  // dft bypass
  input scan_rst_ni,
  input lc_ctrl_pkg::lc_tx_t scanmode_i,

  // ROM configuration
  input  prim_rom_pkg::rom_cfg_t       rom_cfg_i
);

  import top_pkg::*;
  import tlul_pkg::*;

  // if pipeline=1, do not allow pass through and always break the path
  // if pipeline is 0, passthrough the fifo completely
  localparam bit FifoPass = PipeLine ? 1'b0 : 1'b1;
  localparam int unsigned FifoDepth = PipeLine ? 2 : 0;
  // ICache creates more outstanding transactions
  localparam int NumOutstandingReqs = ICache ? 8 : 2;

  // Instruction interface (internal)
  logic               instr_req;
  logic               instr_gnt;
  logic               instr_rvalid;
  logic [31:0]        instr_addr;
  logic [31:0]        instr_rdata;
  logic               instr_err;

  // Data interface (internal)
  logic               data_req;
  logic               data_gnt;
  logic               data_rvalid;
  logic               data_we;
  logic [3:0]         data_be;
  logic [31:0]        data_addr;
  logic [31:0]        data_wdata;
  logic [31:0]        data_rdata;
  logic               data_err;

  // Data interface for master adapter
  logic               m_req;
  logic               m_gnt;
  logic               m_rvalid;
  logic [31:0]        m_rdata;
  logic               m_err;

  // Data interface for slave adapter
  logic               s_req;
  logic               s_gnt;
  logic               s_rvalid;
  logic [31:0]        s_rdata;
  logic               s_err;

  // Data interface for internal RAM
  logic               ram_req;
  logic               ram_rvalid;
  logic [31:0]        ram_mask;
  logic [14:0]        ram_addr;
  logic [31:0]        ram_rdata;
  logic               ram_err;

  // Interface for internal ROM
  logic               rom_req;
  logic               rom_rvalid;
  logic [11:0]        rom_addr;
  logic [31:0]        rom_rdata;

  // Data interface for internal ROM
  logic               data2rom_req;
  logic               rom2data_gnt;
  logic               rom2data_rvalid;
  logic [31:0]        data2rom_addr;
  logic [31:0]        rom2data_rdata;

  // Pipeline interfaces
  tl_h2d_t            tl_d_ibex2fifo;
  tl_d2h_t            tl_d_fifo2ibex;
  tl_d2h_t            tl_s_ibex2fifo;
  tl_h2d_t            tl_s_fifo2ibex;

  //Interrupt notifying a message has been received from master core
  logic               irq_fast_14;

  // Intermediate TL signals to connect an sram used in simulations.
  tlul_pkg::tl_h2d_t  tl_d_o_int;
  tlul_pkg::tl_d2h_t  tl_d_i_int;

`ifdef RVFI
  logic        rvfi_valid;
  logic [63:0] rvfi_order;
  logic [31:0] rvfi_insn;
  logic        rvfi_trap;
  logic        rvfi_halt;
  logic        rvfi_intr;
  logic [ 1:0] rvfi_mode;
  logic [ 1:0] rvfi_ixl;
  logic [ 4:0] rvfi_rs1_addr;
  logic [ 4:0] rvfi_rs2_addr;
  logic [ 4:0] rvfi_rs3_addr;
  logic [31:0] rvfi_rs1_rdata;
  logic [31:0] rvfi_rs2_rdata;
  logic [31:0] rvfi_rs3_rdata;
  logic [ 4:0] rvfi_rd_addr;
  logic [31:0] rvfi_rd_wdata;
  logic [31:0] rvfi_pc_rdata;
  logic [31:0] rvfi_pc_wdata;
  logic [31:0] rvfi_mem_addr;
  logic [ 3:0] rvfi_mem_rmask;
  logic [ 3:0] rvfi_mem_wmask;
  logic [31:0] rvfi_mem_rdata;
  logic [31:0] rvfi_mem_wdata;
`endif

  // Escalation receiver that converts differential
  // protocol into single ended signal.
  logic esc_irq_nm;
  prim_esc_receiver u_prim_esc_receiver (
    .clk_i    (clk_esc_i),
    .rst_ni   (rst_esc_ni),
    .esc_en_o (esc_irq_nm),
    .esc_rx_o,
    .esc_tx_i
  );

  // Synchronize to fast Ibex clock domain.
  logic irq_nm;
  prim_flop_2sync #(
    .Width(1)
  ) u_prim_flop_2sync (
    .clk_i,
    .rst_ni,
    .d_i    (esc_irq_nm),
    .q_o    (irq_nm)
  );

  // Alert outputs
  // TODO - Wire these up once driven
  logic alert_minor, alert_major;
  logic unused_alert_minor, unused_alert_major;
  assign unused_alert_minor = alert_minor;
  assign unused_alert_major = alert_major;

  lc_ctrl_pkg::lc_tx_t [0:0] lc_cpu_en;
  prim_lc_sync u_lc_sync (
    .clk_i,
    .rst_ni,
    .lc_en_i  (lc_cpu_en_i),
    .lc_en_o  (lc_cpu_en)
  );

  lc_ctrl_pkg::lc_tx_t [0:0] pwrmgr_cpu_en;
  prim_lc_sync u_pwrmgr_sync (
    .clk_i,
    .rst_ni,
    .lc_en_i  (pwrmgr_cpu_en_i),
    .lc_en_o  (pwrmgr_cpu_en)
  );

  ibex_top #(
    .PMPEnable        (PMPEnable),
    .PMPGranularity   (PMPGranularity),
    .PMPNumRegions    (PMPNumRegions),
    .MHPMCounterNum   (MHPMCounterNum),
    .MHPMCounterWidth (MHPMCounterWidth),
    .RV32E            (RV32E),
    .RV32M            (RV32M),
    .RV32B            (RV32B),
    .RegFile          (RegFile),
    .BranchTargetALU  (BranchTargetALU),
    .WritebackStage   (WritebackStage),
    .ICache           (ICache),
    .ICacheECC        (ICacheECC),
    .BranchPredictor  (BranchPredictor),
    .DbgTriggerEn     (DbgTriggerEn),
    .SecureIbex       (SecureIbex),
    .DmHaltAddr       (DmHaltAddr),
    .DmExceptionAddr  (DmExceptionAddr)
  ) u_core (
    .clk_i,
    .rst_ni,


    .test_en_i      (scanmode_i == lc_ctrl_pkg::On),
    .scan_rst_ni,

    .ram_cfg_i,

    .hart_id_i,
    .boot_addr_i,

    .instr_req_o    (instr_req),
    .instr_gnt_i    (instr_gnt),
    .instr_rvalid_i (instr_rvalid),
    .instr_addr_o   (instr_addr),
    .instr_rdata_i  (instr_rdata),
    .instr_err_i    (1'b0),

    .data_req_o     (data_req),
    .data_gnt_i     (data_gnt),
    .data_rvalid_i  (data_rvalid),
    .data_we_o      (data_we),
    .data_be_o      (data_be),
    .data_addr_o    (data_addr),
    .data_wdata_o   (data_wdata),
    .data_rdata_i   (data_rdata),
    .data_err_i     (data_err),

    .irq_software_i,
    .irq_timer_i,
    .irq_external_i,
    .irq_fast_i     ({irq_fast_14, 14'b0}),
    .irq_nm_i       (irq_nm),

    .debug_req_i,
    .crash_dump_o,

`ifdef RVFI
    .rvfi_valid,
    .rvfi_order,
    .rvfi_insn,
    .rvfi_trap,
    .rvfi_halt,
    .rvfi_intr,
    .rvfi_mode,
    .rvfi_ixl,
    .rvfi_rs1_addr,
    .rvfi_rs2_addr,
    .rvfi_rs3_addr,
    .rvfi_rs1_rdata,
    .rvfi_rs2_rdata,
    .rvfi_rs3_rdata,
    .rvfi_rd_addr,
    .rvfi_rd_wdata,
    .rvfi_pc_rdata,
    .rvfi_pc_wdata,
    .rvfi_mem_addr,
    .rvfi_mem_rmask,
    .rvfi_mem_wmask,
    .rvfi_mem_rdata,
    .rvfi_mem_wdata,
`endif

    .fetch_enable_i   (lc_cpu_en[0] == lc_ctrl_pkg::On && pwrmgr_cpu_en[0] == lc_ctrl_pkg::On),
    .alert_minor_o    (alert_minor),
    .alert_major_o    (alert_major),
    .core_sleep_o
  );

  prim_rom_adv #(
    .Width(32),
    .Depth(4096),
    .MemInitFile(UntrustedRomBootFile)
  ) u_instr_mem (
    .clk_i,
    .rst_ni,
    .req_i    (rom_req),
    .addr_i   (rom_addr),
    .rvalid_o (rom_rvalid),
    .rdata_o  (rom_rdata),
    .cfg_i    (rom_cfg_i)
  );

  prim_ram_1p_adv #(
  .Depth(32768),
  .Width(32)
  ) u_ram_mem (
    .clk_i,
    .rst_ni,

    .req_i    (ram_req),
    .write_i  (data_we),
    .addr_i   (ram_addr),
    .wdata_i  (data_wdata),
    .wmask_i  (ram_mask),
    .rdata_o  (ram_rdata),
    .rvalid_o (ram_rvalid),
    .rerror_o (ram_err),
    .cfg_i    (ram_cfg_i)
);

  tlul_adapter_host #(
    .MAX_REQS(2)
  ) tl_adapter_host_d_ibex (
    .clk_i,
    .rst_ni,
    .req_i      (m_req),
    .type_i     (tlul_pkg::DataType),
    .gnt_o      (m_gnt),
    .addr_i     (data_addr),
    .we_i       (data_we),
    .wdata_i    (data_wdata),
    .be_i       (data_be),
    .valid_o    (m_rvalid),
    .rdata_o    (m_rdata),
    .err_o      (m_err),
    .intg_err_o (),
    .tl_o       (tl_d_ibex2fifo),
    .tl_i       (tl_d_fifo2ibex)
  );

  tlul_fifo_sync #(
    .ReqPass(FifoPass),
    .RspPass(FifoPass),
    .ReqDepth(FifoDepth),
    .RspDepth(FifoDepth)
  ) fifo_d (
    .clk_i,
    .rst_ni,
    .tl_h_i       (tl_d_ibex2fifo),
    .tl_h_o       (tl_d_fifo2ibex),
    .tl_d_o       (tl_d_o_int),
    .tl_d_i       (tl_d_i_int),
    .spare_req_i  (1'b0),
    .spare_req_o  (),
    .spare_rsp_i  (1'b0),
    .spare_rsp_o  ()
  );

  tlul_adapter_slave tl_adapter_slave_d_ibex (
    .clk_i,
    .rst_ni,
    .req_i    (s_req),
    .gnt_o    (s_gnt),
    .addr_i   (data_addr),
    .we_i     (data_we),
    .wdata_i  (data_wdata),
    .be_i     (data_be),
    .valid_o  (s_rvalid),
    .rdata_o  (s_rdata),
    .err_o    (s_err),
    .irq_o    (irq_fast_14),
    .tl_o     (tl_s_ibex2fifo),
    .tl_i     (tl_s_fifo2ibex)
  );

  tlul_fifo_sync #(   // flipped compared to the other
    .ReqPass(FifoPass),
    .RspPass(FifoPass),
    .ReqDepth(FifoDepth),
    .RspDepth(FifoDepth)
    ) fifo_s (
    .clk_i,
    .rst_ni,
    .tl_h_i       (tl_s_i),
    .tl_h_o       (tl_s_o),
    .tl_d_o       (tl_s_fifo2ibex),
    .tl_d_i       (tl_s_ibex2fifo),
    .spare_req_i  (1'b0),
    .spare_req_o  (),
    .spare_rsp_i  (1'b0),
    .spare_rsp_o  ()
  );

  ibex_data_arb ibex_data_arbiter (
    .clk_i,
    .rst_ni,
    .data_req_i     (data_req),
    .data_gnt_o     (data_gnt),
    .data_rvalid_o  (data_rvalid),
    .data_we_i      (data_we),
    .data_be_i      (data_be),
    .data_addr_i    (data_addr),
    .data_rdata_o   (data_rdata),
    .data_err_o     (data_err),
    .m_req_o        (m_req),
    .m_gnt_i        (m_gnt),
    .m_rvalid_i     (m_rvalid),
    .m_rdata_i      (m_rdata),
    .m_err_i        (m_err),
    .s_req_o        (s_req),
    .s_gnt_i        (s_gnt),
    .s_rvalid_i     (s_rvalid),
    .s_rdata_i      (s_rdata),
    .s_err_i        (s_err),
    .rom_req_o      (data2rom_req),
    .rom_gnt_i      (rom2data_gnt),
    .rom_addr_o     (data2rom_addr),
    .rom_rvalid_i   (rom2data_rvalid),
    .rom_rdata_i    (rom2data_rdata),
    .ram_req_o      (ram_req),
    .ram_addr_o     (ram_addr),
    .ram_mask_o     (ram_mask),
    .ram_rvalid_i   (ram_rvalid),
    .ram_rdata_i    (ram_rdata),
    .ram_err_i      (ram_err)
  );

  rom_arb rom_arbiter (

    .clk_i,
    .rst_ni,
    .instr_req_i    (instr_req),
    .instr_gnt_o    (instr_gnt),
    .instr_rvalid_o (instr_rvalid),
    .instr_addr_i   (instr_addr),
    .instr_rdata_o  (instr_rdata),
    .data_req_i     (data2rom_req),
    .data_gnt_o     (rom2data_gnt),
    .data_rvalid_o  (rom2data_rvalid),
    .data_addr_i    (data2rom_addr),
    .data_rdata_o   (rom2data_rdata),
    .rom_req_o      (rom_req),
    .rom_addr_o     (rom_addr),
    .rom_rvalid_i   (rom_rvalid),
    .rom_rdata_i    (rom_rdata)
);

  //
  // Interception point for connecting simulation SRAM by disconnecting the tl_d output. The
  // disconnection is done only if `SYNTHESIS is NOT defined AND `RV_CORE_IBEX_SIM_SRAM is
  // defined.
  //
//`ifdef RV_CORE_IBEX_SIM_SRAM
//`ifdef SYNTHESIS
  // Induce a compilation error by instantiating a non-existent module.
//  illegal_preprocessor_branch_taken u_illegal_preprocessor_branch_taken();
//`endif
//`else
  assign tl_d_o     = tl_d_o_int;
  assign tl_d_i_int = tl_d_i;
//`endif

`ifdef RVFI
  ibex_tracer ibex_tracer_i (
    .clk_i,
    .rst_ni,

    .hart_id_i,

    .rvfi_valid,
    .rvfi_order,
    .rvfi_insn,
    .rvfi_trap,
    .rvfi_halt,
    .rvfi_intr,
    .rvfi_mode,
    .rvfi_ixl,
    .rvfi_rs1_addr,
    .rvfi_rs2_addr,
    .rvfi_rs3_addr,
    .rvfi_rs1_rdata,
    .rvfi_rs2_rdata,
    .rvfi_rs3_rdata,
    .rvfi_rd_addr,
    .rvfi_rd_wdata,
    .rvfi_pc_rdata,
    .rvfi_pc_wdata,
    .rvfi_mem_addr,
    .rvfi_mem_rmask,
    .rvfi_mem_wmask,
    .rvfi_mem_rdata,
    .rvfi_mem_wdata
  );
`endif



endmodule
