// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

// TL-UL Slave adapter converts master requests from the TL-UL bus to data signals for the IBEX core. The request
// is sent to the core in form of an interrupt. The core is then responsible to send a "ready" message to the adapter
// signalling that it's ready to receive the request. This "ready" message has the following format:
//
// addr_o = ADAPTER_ADDRESS
// we_o = 0
//
// The adapter sends the bus request message translated to the IBEX data interface one clock cycle after it receives
// the "ready" message from the core. Only the a_data part of the bus message will make it to the core, and the content
// of that signal needs to contain all the necessary information for the core.
//
// When the core wants to respond, it sends a message to the host address in the following format:
// addr_o = HOST_ADDRESS
// be_o = desired mask
// wdata_o = desired data response
//
// The adapter will send a response to the core the following cycle to confirm the transfer has been made.
// The adapter is responsible for keeping track of the sources for each host message and attaches it to the responses
// separately from the core. It relies on the core to send responses in the order of receiving requests.



module tlul_adapter_slave (
  input clk_i,
  input rst_ni,

  // Interface with the Ibex core
  input                              req_i,
  output logic                       gnt_o,
  input  logic [top_pkg::TL_AW-1:0]  addr_i,
  input  logic                       we_i,
  input  logic [top_pkg::TL_DW-1:0]  wdata_i,
  input  logic [top_pkg::TL_DBW-1:0] be_i,
  output logic                       valid_o,
  output logic [top_pkg::TL_DW-1:0]  rdata_o,
  output logic                       err_o,
  output logic                       irq_o,

  // TL-interface with the bus
  output tlul_pkg::tl_d2h_t          tl_o,
  input  tlul_pkg::tl_h2d_t          tl_i

);
  localparam int WordSize = $clog2(top_pkg::TL_DBW);
  localparam logic [31:0] ADAPTER_ADDRESS = 32'h40200000;
  localparam logic [31:0] HOST_ADDRESS    = 32'h40300000;

  typedef enum logic [1:0] {
    IDLE          = 3'b000,
    WAIT_READY    = 3'b001,
    FORWARD_MSG   = 3'b010,
    WAIT_RESPONSE = 3'b011,
    ACK_RESPONSE  = 3'b100
  } slave_adapter_state_t;

  slave_adapter_state_t curr_state, next_state;

  logic msg_received;
  logic cpu_ready;
  logic response_sent;

  logic source;

  tlul_pkg::tl_d2h_t tl_i_fifo;
  tlul_pkg::tl_h2d_t tl_o_fifo;

  assign msg_received = tl_i.a_valid && tl_o.a_ready;
  assign cpu_ready = req_i && (addr_i == ADAPTER_ADDRESS) && !we_o;
  assign response_sent = req_i && (addr_i == HOST_ADDRESS) && tl_i.d_ready;

  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni) begin
      curr_state <= IDLE;
    end else begin
      curr_state <= next_state;
    end
  end

  // Record source from incoming message to transmit it back with response
  always_ff @(posedge clk_i or negedge rst_ni) begin
    if (!rst_ni)
      source <= '0;
    else if (tl_i_fifo.a_valid)
      source <= tl_i_fifo.a_source;
  end

  // FSM
  always_comb begin
    gnt_o       = '0;
    valid_o     = '0;
    rdata_o     = '0;
    err_o       = '0;
    intg_err_o  = '0;
    irq_o       = '0;
    tl_o_fifo   = '0;
    next_state  = curr_state;

    unique case (curr_state)
    IDLE: begin
      irq_o = msg_received;
      next_state = (msg_received) ? WAIT_READY : IDLE;
    end
    WAIT_READY: begin
      gnt_o = '1;
      irq_o = '1;
      next_state = (cpu_ready) ? FORWARD_MSG : WAIT_READY;
    end
    FORWARD_MSG: begin
      tl_o_fifo.a_ready = '1;
      valid_o = '1;
      rdata_o = tl_i_fifo.a_data;
      next_state = WAIT_RESPONSE;
    end
    WAIT_RESPONSE: begin
      tl_o_fifo.d_valid = req_i && (addr_i == HOST_ADDRESS);
      tl_o_fifo.d_opcode = (we_i) ? AccessAckData : AccessAck;
      tl_o_fifo.d_size = 2'h2;
      tl_o_fifo.d_source = source;
      tl_o_fifo.d_data = wdata_i & {8'(be_i[3]), 8'(be_i[2]), 8'(be_i[1]), 8'(be_i[0])};
      next_state = (response_sent) ? ACK_RESPONSE : WAIT_RESPONSE;
    end
    ACK_RESPONSE: begin
      rvalid_o = '1;
      next_state = IDLE;
    end
    default:     next_state  = curr_state;
    endcase
  end

  // FIFO holds the incoming requests until the core enters interrupt service routine
  tlul_fifo_sync #(
  .ReqPass(0),
  .RspPass(0),
  .ReqDepth(1),
  .RspDepth(1)
) fifo_i (
  .clk_i,
  .rst_ni,
  .tl_h_i      (tl_i),
  .tl_h_o      (tl_o),
  .tl_d_o      (tl_i_fifo),
  .tl_d_i      (tl_o_fifo),
  .spare_req_i (1'b0),
  .spare_req_o (),
  .spare_rsp_i (1'b0),
  .spare_rsp_o ());

  endmodule
