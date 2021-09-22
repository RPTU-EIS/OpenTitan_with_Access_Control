// Copyright lowRISC contributors.
// Licensed under the Apache License, Version 2.0, see LICENSE for details.
// SPDX-License-Identifier: Apache-2.0

// Author: Dino Mehmedagić

// Bus security control module for OpenTitan

// This module is configured by the main core sending a 'write' TL-UL message to one of the 
// module's registers. For a successful write, the message should contain configuration bits 
// starting at the MSB of the message, in order defined in the bus_ctrl_pkg.sv file. The 
// configuration for every module determines whether it is in the trusted (1) or untrusted (0)
// environment. The module has three registers: 
//      - a masters register (addr 0x40800000) keeps track of the security environment of each
//          master module that is restrictable (all except main core and debug module)
//      - a slaves register (addr 0x40800100) keeps track of the security environment of each
//          slave module connected to the main crossbar.
//      - a peripheral slaves register (addr 0x40800200) keeps track of the security environment
//          of each slave module connected to the peripheral crossbar.
// The module outputs the register values to the crossbar logic, which should take it into account
// when routing the master requests.

module bus_ctrl
  import bus_ctrl_pkg::*;

(
    input clk_i,
    input rst_ni,

    // Bus Interface (device)
    input  tlul_pkg::tl_h2d_t tl_i,
    output tlul_pkg::tl_d2h_t tl_o,

    // Register value as output to the crossbar modules
    output master_bits_t        master_bits_o,
    output slave_bits_t         slave_bits_o,
    output slave_bits_peri_t    slave_bits_peri_o
);
    // Configuration registers
    master_bits_t                       master_reg;
    slave_bits_t                        slave_reg;
    slave_bits_peri_t                   slave_peri_reg;

    // FSM-realted variables to correctly communicate with the main core sending the cfg request
    bus_ctrl_state_t                    curr_state;
    bus_ctrl_state_t                    next_state;
    logic  [top_pkg::TL_AIW-1:0]        source;
    logic                               error;
    logic  [top_pkg::TL_DW-1:0]         data;

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
            if (tl_i.a_address == 32'h40800000) begin
                master_reg  <= data [top_pkg::TL_DW-1:MASTER_REG_END];
            end else if (tl_i.a_address == 32'h40800100) begin
                slave_reg   <= data [top_pkg::TL_DW-1:SLAVE_REG_END];
            end else if (tl_i.a_address == 32'h40800200) begin
                slave_peri_reg  <= data [top_pkg::TL_DW-1:SLAVE_PERI_REG_END];
            end
            source      <= tl_i.a_source;
        end
    end

    // FSM
    always_comb begin
        unique case (curr_state)
        IDLE: begin
            tl_o.d_valid    = '0;
            tl_o.d_opcode   = tlul_pkg::AccessAck;
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
            tl_o.d_opcode   = tlul_pkg::AccessAck;
            tl_o.d_param    = '0;
            tl_o.d_size     = '0;
            tl_o.d_source   = source;
            tl_o.d_sink     = '0;
            tl_o.d_data     = '0;
            tl_o.d_user     = '0;
            tl_o.d_error    = '0;
            tl_o.a_ready    = '0;
            if (tl_i.d_ready)
                next_state  = IDLE;
            else
                next_state  = ACK;
        end
        ACK_ERR: begin
            tl_o.d_valid    = '1;
            tl_o.d_opcode   = tlul_pkg::AccessAck;
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
        if (tl_i.a_opcode != tlul_pkg::PutFullData && tl_i.a_opcode != tlul_pkg::PutPartialData)
            error = 1'b1;
        else if (tl_i.a_size < 2)
            error = 1'b1;
        else
            error = 1'b0;
    end

    // Convert 4-bit byte-mask from the TL-message to a 32-bit-for-bit mask
    genvar i;
    logic [31:0] data_mask;
    for (i = 0; i < 4; i = i + 1) begin
        always_comb begin
        data_mask[i*8 +: 8] = tl_i.a_mask[i]? 8'hff : 8'h00;
        end
    end

    assign data = (tl_i.a_opcode == tlul_pkg::PutPartialData) ?
                     tl_i.a_data & data_mask : tl_i.a_data;
    assign master_bits_o        = master_reg;
    assign slave_bits_o         = slave_reg;
    assign slave_bits_peri_o    = slave_peri_reg;

endmodule
