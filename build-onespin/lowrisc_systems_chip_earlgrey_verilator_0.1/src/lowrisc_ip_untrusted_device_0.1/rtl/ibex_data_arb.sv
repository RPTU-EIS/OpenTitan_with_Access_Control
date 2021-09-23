// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

// This module is responsible for the routing of requests sent by the core's data interface
// to the correct recipient, as well as keeping track on the order of those requests, as responses
// need to be sent in order

module ibex_data_arb (

  input         clk_i,
  input         rst_ni,

  // Data interface from the Ibex core
  input         data_req_i,
  output    var data_gnt_o,
  output        data_rvalid_o,
  input         data_we_i,
  input  [3:0]  data_be_i,
  input  [31:0] data_addr_i,
  output [31:0] data_rdata_o,
  output        data_err_o,

  // Data interface for master (host) adapter
  output        m_req_o,
  input         m_gnt_i,
  input         m_rvalid_i,
  input  [31:0] m_rdata_i,
  input         m_err_i,

  // Data interface for slave adapter
  output        s_req_o,
  input         s_gnt_i,
  input         s_rvalid_i,
  input  [31:0] s_rdata_i,
  input         s_err_i,

  // Interface with ROM
  output        rom_req_o,
  input         rom_gnt_i,
  output [31:0] rom_addr_o,
  input         rom_rvalid_i,
  input  [31:0] rom_rdata_i,

  // Interface with RAM
  output        ram_req_o,
  output [14:0] ram_addr_o,
  output [31:0] ram_mask_o,
  input         ram_rvalid_i,
  input  [31:0] ram_rdata_i,
  input         ram_err_i
);

  typedef enum logic [2:0] {
    SLAVE   = 3'b000,
    ROM_R   = 3'b001,
    ROM_W   = 3'b010,
    RAM_R   = 3'b011,
    RAM_W   = 3'b100,
    MASTER  = 3'b101
  } destination_enc_t;


  logic             outstanding_fifo_wvalid;
  logic             outstanding_fifo_wready;
  destination_enc_t outstanding_fifo_wdata;
  logic             outstanding_fifo_rvalid;
  logic             outstanding_fifo_rready;
  destination_enc_t outstanding_fifo_rdata;

  logic             incoming_slave_rvalid;
  logic             incoming_slave_rready;
  logic [32:0]      incoming_slave_rdata;

  logic             incoming_rom_rvalid;
  logic             incoming_rom_rready;
  logic [31:0]      incoming_rom_rdata;

  logic             incoming_ram_rvalid;
  logic             incoming_ram_rready;
  logic [32:0]      incoming_ram_rdata;

  logic             incoming_master_rvalid;
  logic             incoming_master_rready;
  logic [32:0]      incoming_master_rdata;


  // This FIFO records destinations of outstanding messages in order, so that the responses can
  // be properly sequenced back to the core.
  prim_fifo_sync #(
    .Width(3),
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
    .rready_i (outstanding_fifo_rready),
    .rdata_o  (outstanding_fifo_rdata),
    .full_o   (),
    .depth_o  ()
  );

  genvar i;
  for (i = 0; i < 4; i = i + 1) begin
    always_comb begin
      ram_mask_o[i*8 +: 8] = data_be_i[i]? 8'hff : 8'h00;
    end
  end

  always_comb begin
    data_gnt_o                  =   '0;
    m_req_o                     =   '0;
    s_req_o                     =   '0;
    rom_req_o                   =   '0;
    rom_addr_o                  =   '0;
    ram_req_o                   =   '0;
    ram_addr_o                  =   '0;
    outstanding_fifo_wvalid     =   '0;
    outstanding_fifo_wdata      =   '0;
    if (data_req_i) begin
      if (data_addr_i == tlul_adapter_slave_pkg::ADAPTER_ADDRESS ||
          data_addr_i == tlul_adapter_slave_pkg::MASTER_ADDRESS) begin
        data_gnt_o              =   s_gnt_i &&  outstanding_fifo_wready;
        s_req_o                 =   '1;
        outstanding_fifo_wvalid =   s_gnt_i;
        outstanding_fifo_wdata     =   SLAVE;
      end else if ((data_addr_i & ~(untrusted_device_pkg::UNTRUSTED_ROM_MASK))
                  == untrusted_device_pkg::UNTRUSTED_ROM_ADDRESS) begin
        data_gnt_o              =   rom_gnt_i & outstanding_fifo_wready;
        rom_req_o               =   '1;
        rom_addr_o              =   data_addr_i;
        outstanding_fifo_wvalid =   rom_gnt_i;
        outstanding_fifo_wdata     =   (data_we_i) ?   ROM_W   :   ROM_R;
      end else if ((data_addr_i & ~(untrusted_device_pkg::UNTRUSTED_RAM_MASK))
                  == untrusted_device_pkg::UNTRUSTED_RAM_ADDRESS) begin
        data_gnt_o              =   outstanding_fifo_wready;
        ram_req_o               =   '1;
        ram_addr_o              =   data_addr_i[16:2];
        outstanding_fifo_wvalid =   '1;
        outstanding_fifo_wdata     =   (data_we_i) ?   RAM_W   :   RAM_R;
      end else begin
        data_gnt_o              =   m_gnt_i && outstanding_fifo_wready;
        m_req_o                 =   '1;
        outstanding_fifo_wvalid =   m_gnt_i;
        outstanding_fifo_wdata  =   MASTER;
      end
    end
  end

  // These FIFOs record up to 16 response messages from each interface respectively. Their messages
  // are processed through when the outstanding_reqs_fifo signals its their turn to respond to the
  // core.
  prim_fifo_sync #(
    .Width(33),
    .Depth(16)
  ) incoming_slave_fifo (
    .clk_i,
    .rst_ni,
    .clr_i    ('0),
    .wvalid_i (s_rvalid_i),
    .wready_o (),
    .wdata_i  ({s_rdata_i, s_err_i}),
    .rvalid_o (incoming_slave_rvalid),
    .rready_i (incoming_slave_rready),
    .rdata_o  (incoming_slave_rdata),
    .full_o   (),
    .depth_o  ()
  );

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
    .rready_i (incoming_rom_rready),
    .rdata_o  (incoming_rom_rdata),
    .full_o   (),
    .depth_o  ()
  );

    prim_fifo_sync #(
    .Width(33),
    .Depth(16)
    ) incoming_ram_fifo (
    .clk_i,
    .rst_ni,
    .clr_i    ('0),
    .wvalid_i (ram_rvalid_i),
    .wready_o (),
    .wdata_i  ({ram_rdata_i, ram_err_i}),
    .rvalid_o (incoming_ram_rvalid),
    .rready_i (incoming_ram_rready),
    .rdata_o  (incoming_ram_rdata),
    .full_o   (),
    .depth_o  ()
  );

    prim_fifo_sync #(
    .Width(33),
    .Depth(16)
    ) incoming_master_fifo (
    .clk_i,
    .rst_ni,
    .clr_i    ('0),
    .wvalid_i (m_rvalid_i),
    .wready_o (),
    .wdata_i  ({m_rdata_i, m_err_i}),
    .rvalid_o (incoming_master_rvalid),
    .rready_i (incoming_master_rready),
    .rdata_o  (incoming_master_rdata),
    .full_o   (),
    .depth_o  ()
    );

  logic rom_write_req, ram_needs_ack;

  assign rom_write_req          = (outstanding_fifo_rvalid && outstanding_fifo_rdata == ROM_W)
                                    ?   '1 :    '0;
  assign ram_needs_ack          = (outstanding_fifo_rvalid && outstanding_fifo_rdata == RAM_W)
                                    ?   '1 :    '0;
  assign incoming_slave_rready  = (outstanding_fifo_rvalid && outstanding_fifo_rdata == SLAVE)
                                    ?   '1 :    '0;
  assign incoming_rom_rready    = (outstanding_fifo_rvalid && outstanding_fifo_rdata == ROM_R)
                                    ?   '1 :    '0;
  assign incoming_ram_rready    = (outstanding_fifo_rvalid && outstanding_fifo_rdata == RAM_R)
                                    ?   '1 :    '0;
  assign incoming_master_rready = (outstanding_fifo_rvalid && outstanding_fifo_rdata == MASTER)
                                    ?   '1 :    '0;
  assign outstanding_fifo_rready = (data_rvalid_o)  ?   '1  :   '0;

  always_comb begin
    if (incoming_slave_rvalid && incoming_slave_rready) begin
      data_rvalid_o = '1;
      data_rdata_o  = incoming_slave_rdata [32:1];
      data_err_o    = incoming_slave_rdata [0];
    end else if (incoming_rom_rvalid && incoming_rom_rready) begin
      data_rvalid_o = '1;
      data_rdata_o  = incoming_rom_rdata;
      data_err_o    = '0;
    end else if (incoming_ram_rvalid && incoming_ram_rready) begin
      data_rvalid_o = '1;
      data_rdata_o  = incoming_ram_rdata [32:1];
      data_err_o    = incoming_ram_rdata [0];
    end else if (incoming_master_rvalid && incoming_master_rready) begin
      data_rvalid_o = '1;
      data_rdata_o  = incoming_master_rdata [32:1];
      data_err_o    = incoming_master_rdata [0];
    end else if (rom_write_req) begin
      data_rvalid_o = '1;
      data_rdata_o  = '0;
      data_err_o    = '1;
    end else if (ram_needs_ack) begin
      data_rvalid_o = '1;
      data_rdata_o  = '0;
      data_err_o    = '0;
    end else begin
      data_rvalid_o = '0;
      data_rdata_o  = '0;
      data_err_o    = '0;
    end
  end

endmodule
