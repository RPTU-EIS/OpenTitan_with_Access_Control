// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

// Bus security control module for OpenTitan

// This module is configured by the main core through a TL-UL message. The configuration
// determines for every module whether it is in the trusted (1) or untrusted (0) environment

module bus_ctrl (
    input clk_i,
    input rst_ni,

    // Bus Interface (device)
    input  tlul_pkg::tl_h2d_t tl_i,
    output tlul_pkg::tl_d2h_t tl_o,

    // Host and device bits
    output [tl_main_pkg::N_HOST-1:0]    master_bits,
    output [tl_main_pkg::N_DEVICE-1:0]  slave_bits
);
    // Local derived parameters
    localparam int MASTER_REG_END = top_pkg::TL_DW-tl_main_pkg::N_HOST;
    localparam int SLAVE_REG_START = MASTER_REG_END - 1;
    localparam int SLAVE_REG_END = SLAVE_REG_START - tl_main_pkg::N_DEVICE;
    localparam int TOTAL_IPS = tl_main_pkg::N_HOST + tl_main_pkg::N_DEVICE;

    typedef enum logic [1:0] {
        IDLE     = 2'b00,
        ACK      = 2'b01,
        ACK_ERR  = 2'b10
    } bus_ctrl_state_t;

    logic [tl_main_pkg::N_HOST-1:0]     master_reg;
    logic [tl_main_pkg::N_DEVICE-1:0]   slave_reg;
    bus_ctrl_state_t                    curr_state;
    bus_ctrl_state_t                    next_state;
    logic  [top_pkg::TL_AIW-1:0]        source;
    logic                               error;
    logic                               data;

    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni)
            curr_state <= IDLE;
        else
            curr_state <= next_state;
    end
    // Every valid TL message from the master updates the configuration registers
    always_ff @(posedge clk_i or negedge rst_ni) begin
        if (!rst_ni) begin
            master_reg  <= '0;
            slave_reg   <= '0;
            source      <= '0;
        end else if (tl_i.a_valid && curr_state == IDLE && !error) begin
            master_reg  <= data [top_pkg::TL_DW-1:MASTER_REG_END];
            slave_reg   <= data [SLAVE_REG_START:SLAVE_REG_END];
            source      <= tl_i.a_source;
        end
    end

    // FSM
    always_comb begin
        unique case (curr_state)
        IDLE: begin

            tl_o.d_opcode   = AccessAck;
            tl_o.d_param    = '0;
            tl_o.d_size     = '0;
            tl_o.d_source   = '0;
            tl_o.d_sink     = '0;
            tl_o.d_data     = '0;
            tl_o.d_user     = '0;
            tl_o.d_error    = 1'b0;
            tl_o.a_ready    = 1'b1;
            if (tl_i.a_valid)
                if (error)
                    next_state  = ACK_ERR;
                else
                    next_state  = ACK;
            else
                next_state      = IDLE;
        end
        ACK: begin
            tl_o.d_valid    = 1'b1;
            tl_o.d_opcode   = AccessAck;
            tl_o.d_param    = '0;
            tl_o.d_size     = '0;
            tl_o.d_source   = source;
        end
        ACK_ERR: begin
            tl_o.d_valid    = '1;
            tl_o.d_opcode   = AccessAck;
            tl_o.d_param    = '0;
            tl_o.d_size     = '0;
            tl_o.d_source   = source;
            tl_o.d_sink     = '0;
            tl_o.d_data     = '0;
            tl_o.d_user     = '0;
            tl_o.d_error    = '1;
            tl_o.a_ready    = '0;
            if (tl_i.d_ready)
                next_state  = IDLE;
            else
                next_state  = ACK_ERR;
        end
        default: next_state = IDLE;
        endcase
    end

    // Only write messages are valid
    always_comb begin
        if (tl_i.a_opcode != PutFullData && tl_i.a_opcode != PutPartialData)
            error = 1'b1;
        else if (tl_i.a_size < 2)
            error = 1'b1;
        else
            error = 1'b0;
    end

    assign data = (tl_i.a_opcode == PutPartialData) ? tl_i.a_data & tl_i.a_mask : tl_i.a_data;
    assign master_bits  = master_reg;
    assign slave_bits   = slave_reg;

endmodule
