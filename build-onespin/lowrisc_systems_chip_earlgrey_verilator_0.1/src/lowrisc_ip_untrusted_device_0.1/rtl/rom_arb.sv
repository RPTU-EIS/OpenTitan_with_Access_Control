// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

// This module is responsible for arbitration between the core's instruction and data interface
// when communicating with the ROM memory.

module rom_arb (

  input         clk_i,
  input         rst_ni,

  // Instruction interface from the Ibex core
  input         instr_req_i,
  output    var instr_gnt_o,
  output        instr_rvalid_o,
  input  [31:0] instr_addr_i,
  output [31:0] instr_rdata_o,

  // Data interface from the Ibex core
  input         data_req_i,
  output        data_gnt_o,
  output        data_rvalid_o,
  input  [31:0] data_addr_i,
  output [31:0] data_rdata_o,

  // Interface with ROM
  output        rom_req_o,
  output [11:0] rom_addr_o,
  input         rom_rvalid_i,
  input  [31:0] rom_rdata_i

);

typedef enum logic {
  INSTR = 1'b0,
  DATA  = 1'b1
} arb_t;

arb_t           arb_q, arb_d;
logic           outstanding_fifo_wvalid;
logic           outstanding_fifo_wready;
logic           outstanding_fifo_wdata;
logic           outstanding_fifo_rvalid;
logic           outstanding_fifo_rready;
logic           outstanding_fifo_rdata;

logic           incoming_rom_rvalid;
logic   [31:0]  incoming_rom_rdata;

always_ff @(posedge clk_i or negedge rst_ni) begin
  if (!rst_ni) begin
    arb_q <= '0;
  end else begin
    arb_q <= arb_d;
  end
end

// This FIFO is responsible for keeping track of outstanding reqs to the ROM so that the arbiter
// can properly route the responses
prim_fifo_sync #(
  .Width(1),
  .Depth(16),
  .Pass(0)
) outstanding_reqs_fifo (
  .clk_i,
  .rst_ni,
  .clr_i    (),
  .wvalid_i (outstanding_fifo_wvalid),
  .wready_o (outstanding_fifo_wready),
  .wdata_i  (outstanding_fifo_wdata),
  .rvalid_o (outstanding_fifo_rvalid),
  .rready_i (incoming_rom_rvalid), //outstanding_fifo_rready
  .rdata_o  (outstanding_fifo_rdata),
  .full_o   (),
  .depth_o  ()
);

always_comb begin
  instr_gnt_o               = '0;
  data_gnt_o                = '0;
  rom_req_o                 = '0;
  rom_addr_o                = '0;
  outstanding_fifo_wvalid   = '0;
  outstanding_fifo_wdata    = '0;
  if (instr_req_i && (!data_req_i || data_req_i && arb_q == INSTR)) begin
    rom_req_o               = '1;
    rom_addr_o              = instr_addr_i[13:2];
    instr_gnt_o             = outstanding_fifo_wready;
    arb_d                   = DATA;
    outstanding_fifo_wvalid = '1;
    outstanding_fifo_wdata  = !arb_d;
  end else if (data_req_i && (!instr_req_i || instr_req_i && arb_q == DATA)) begin
    rom_req_o               = '1;
    rom_addr_o              = data_addr_i[13:2];
    data_gnt_o              = outstanding_fifo_wready;
    arb_d                   = INSTR;
    outstanding_fifo_wvalid = '1;
    outstanding_fifo_wdata  = !arb_d;
  end
end

prim_fifo_sync #(
  .Width(32),
  .Depth(16)
) incoming_rom_fifo (
  .clk_i,
  .rst_ni,
  .clr_i    ('0),
  .wvalid_i (rom_rvalid_i),
  .wready_o (),
  .wdata_i  (rom_rdata_i),
  .rvalid_o (incoming_rom_rvalid),
  .rready_i (outstanding_fifo_rvalid),
  .rdata_o  (incoming_rom_rdata),
  .full_o   (),
  .depth_o  ()
);

  always_comb begin
    instr_rvalid_o      = '0;
    instr_rdata_o       = '0;
    data_rvalid_o       = '0;
    data_rdata_o        = '0;
    if (incoming_rom_rvalid && outstanding_fifo_rvalid) begin
      if (outstanding_fifo_rdata == arb_t'(INSTR)) begin
        instr_rvalid_o  = '1;
        instr_rdata_o   = incoming_rom_rdata;
      end else if (outstanding_fifo_rdata == arb_t'(DATA)) begin
        data_rvalid_o   = '1;
        data_rdata_o    = incoming_rom_rdata;
      end
    end
  end

endmodule
