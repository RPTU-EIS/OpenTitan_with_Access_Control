/* function automatic [3:0] gray2dec(input logic [3:0] grayval);
    logic [3:0] dec_tmp, dec_tmp_sub;
    logic                 unused_decsub_msb;

    dec_tmp = '0;
    for (int i = 2; i >= 0; i--) begin
      dec_tmp[i] = dec_tmp[i+1] ^ grayval[i];
    end
    dec_tmp_sub = (3)'(4) - dec_tmp - 1'b1;
    if (grayval[3]) begin
      gray2dec = dec_tmp_sub;
      // Override MSB
      gray2dec[3] = 1'b1;
      unused_decsub_msb = dec_tmp_sub[3];
    end else begin
      gray2dec = dec_tmp;
    end
endfunction */

function automatic async_fifo_ptrs_empty(logic [2:0] wptr_q, wptr_int_gray, wptr_sync, rptr_q, rptr_int_gray, rptr_sync, rptr_sync_q, rptr_gray, wptr_gray);
    
    logic [2:0] wptr_int = gray2dec(wptr_int_gray);
    logic [2:0] rptr_int = gray2dec(rptr_int_gray);

    async_fifo_ptrs_empty = (
        wptr_q == wptr_int                  &&
        wptr_q == wptr_sync                 &&
        wptr_q == rptr_q                    &&
        wptr_q == rptr_int                  &&
        wptr_q == rptr_sync                 &&
        wptr_q == rptr_sync_q               &&
        gray2dec(rptr_gray)     == rptr_q   &&
        gray2dec(wptr_gray)     == wptr_q
    );
endfunction

function automatic jtag_input_fifo_empty_rv_dm();
    jtag_input_fifo_empty_rv_dm = (
        async_fifo_ptrs_empty(
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q
        )   &&
        async_fifo_ptrs_empty(
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q
        )   &&        
        async_fifo_ptrs_empty(
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q
        )   &&
        async_fifo_ptrs_empty(
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q
        )
    );
endfunction

function automatic no_jtag_input_rv_dm();
    no_jtag_input_rv_dm = (
        !top_level_upec.top_earlgrey_1.u_dm_top.jtag_req_i  == '0    &&
        !top_level_upec.top_earlgrey_2.u_dm_top.jtag_req_i  == '0
    );
endfunction

function automatic debug_module_has_been_off_rv_dm();
    debug_module_has_been_off_rv_dm = (
        !top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q.dmactive   && !top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q.dmactive  &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q   == '0    &&
        top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q   == '0    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_sba.state_q                         == '0    &&
        top_level_upec.top_earlgrey_2.u_dm_top.i_dm_sba.state_q                         == '0
    );
endfunction

function automatic input_equivalence_rv_dm();
    input_equivalence_rv_dm = (
        top_level_upec.top_earlgrey_1.u_dm_top.clk_i            == top_level_upec.top_earlgrey_2.u_dm_top.clk_i         &&
        top_level_upec.top_earlgrey_1.u_dm_top.rst_ni           == top_level_upec.top_earlgrey_2.u_dm_top.rst_ni        &&
        top_level_upec.top_earlgrey_1.u_dm_top.hw_debug_en_i    == top_level_upec.top_earlgrey_2.u_dm_top.hw_debug_en_i &&
        top_level_upec.top_earlgrey_1.u_dm_top.scanmode_i       == top_level_upec.top_earlgrey_2.u_dm_top.scanmode_i    &&
        top_level_upec.top_earlgrey_1.u_dm_top.scan_rst_ni      == top_level_upec.top_earlgrey_2.u_dm_top.scan_rst_ni   &&
        top_level_upec.top_earlgrey_1.u_dm_top.unavailable_i    == top_level_upec.top_earlgrey_2.u_dm_top.unavailable_i &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_d_i           == top_level_upec.top_earlgrey_2.u_dm_top.tl_d_i        &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_h_i           == top_level_upec.top_earlgrey_2.u_dm_top.tl_h_i        &&
        top_level_upec.top_earlgrey_1.u_dm_top.jtag_req_i       == top_level_upec.top_earlgrey_2.u_dm_top.jtag_req_i
    );
endfunction

function automatic output_equivalence_rv_dm();
    output_equivalence_rv_dm = (
        top_level_upec.top_earlgrey_1.u_dm_top.ndmreset_o   == top_level_upec.top_earlgrey_2.u_dm_top.ndmreset_o    &&
        top_level_upec.top_earlgrey_1.u_dm_top.dmactive_o   == top_level_upec.top_earlgrey_2.u_dm_top.dmactive_o    &&
        top_level_upec.top_earlgrey_1.u_dm_top.debug_req_o  == top_level_upec.top_earlgrey_2.u_dm_top.debug_req_o   &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_d_o       == top_level_upec.top_earlgrey_2.u_dm_top.tl_d_o        &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_h_o       == top_level_upec.top_earlgrey_2.u_dm_top.tl_h_o        &&
        top_level_upec.top_earlgrey_1.u_dm_top.jtag_rsp_o   == top_level_upec.top_earlgrey_2.u_dm_top.jtag_rsp_o
    );
endfunction

function automatic visible_soc_state_equivalence_rv_dm();
    visible_soc_state_equivalence_rv_dm = (
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q.hartselhi  == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q.hartselhi   &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q.hartsello  == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q.hartsello   &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q.haltreq    == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q.haltreq
    );
endfunction

function automatic micro_soc_state_equivalence_rv_dm();
    micro_soc_state_equivalence_rv_dm = (
        top_level_upec.top_earlgrey_1.u_dm_top.dap.address_q                                                                                                == top_level_upec.top_earlgrey_2.u_dm_top.dap.address_q                                                                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.data_q                                                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.dap.data_q                                                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.dr_q                                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.dr_q                                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.error_q                                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.error_q                                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.storage                                                                              == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.storage                                                                               &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q                                                                         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q                                                                          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q                                                                         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q                                                                          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.storage                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.storage                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.bypass_q                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.bypass_q                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.dtmcs_q                                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.dtmcs_q                                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.idcode_q                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.idcode_q                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_q                                                                                 == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_q                                                                                  &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_shift_q                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_shift_q                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.tap_state_q                                                                               == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.tap_state_q                                                                                &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.td_o                                                                                      == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.td_o                                                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.tdo_oe_o                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.tdo_oe_o                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.state_q                                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.state_q                                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.abstractauto_q                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.abstractauto_q                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.cmd_valid_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.cmd_valid_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.cmderr_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.cmderr_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.command_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.command_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.data_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.data_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.havereset_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.havereset_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_rptr                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_rptr                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_wptr                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_wptr                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.storage                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.storage                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.under_rst                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.under_rst                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.progbuf_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.progbuf_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbaddr_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbaddr_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbcs_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbcs_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbdata_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbdata_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.fwd_rom_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.fwd_rom_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.gen_rom_snd_scratch.i_debug_rom.addr_q                                                              == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.gen_rom_snd_scratch.i_debug_rom.addr_q                                                               &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.halted_q                                                                                            == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.halted_q                                                                                             &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.rdata_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.rdata_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.resuming_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.resuming_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.state_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.state_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.word_enable32_q                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.word_enable32_q                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_sba.state_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_sba.state_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.rvalid                                                                                                       == top_level_upec.top_earlgrey_2.u_dm_top.rvalid                                                                                                        &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.intg_error_q                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.intg_error_q                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_rptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_rptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_wptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_wptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.storage                                                      == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.storage                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.under_rst                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.under_rst                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_rptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_rptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_wptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_wptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.storage                                                      == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.storage                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.under_rst                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.under_rst                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_rptr                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_rptr                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_wptr                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_wptr                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.storage                                                  == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.storage                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.under_rst                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.under_rst                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.intg_err_q                                                                               == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.intg_err_q                                                                                &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q                                                                       == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o  == top_level_upec.top_earlgrey_2.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   &&
        top_level_upec.top_earlgrey_1.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o  == top_level_upec.top_earlgrey_2.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o
    );
endfunction

function automatic soc_state_equivalence_rv_dm();
    soc_state_equivalence_rv_dm = (
        top_level_upec.top_earlgrey_1.u_dm_top.dap.address_q                                                                                                == top_level_upec.top_earlgrey_2.u_dm_top.dap.address_q                                                                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.data_q                                                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.dap.data_q                                                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.dr_q                                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.dr_q                                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.error_q                                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.error_q                                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_gray_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_q                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_rptr_sync_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_gray_q                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.fifo_wptr_q                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.storage                                                                              == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.storage                                                                               &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_req.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_gray_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q                                                                         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_q                                                                          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_rptr_sync_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q                                                                    == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_gray_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q                                                                         == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.fifo_wptr_q                                                                          &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.storage                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.storage                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o        == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_cdc.i_cdc_resp.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o         &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.bypass_q                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.bypass_q                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.dtmcs_q                                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.dtmcs_q                                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.idcode_q                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.idcode_q                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_q                                                                                 == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_q                                                                                  &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_shift_q                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.jtag_ir_shift_q                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.tap_state_q                                                                               == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.tap_state_q                                                                                &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.td_o                                                                                      == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.td_o                                                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.i_dmi_jtag_tap.tdo_oe_o                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.i_dmi_jtag_tap.tdo_oe_o                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.dap.state_q                                                                                                  == top_level_upec.top_earlgrey_2.u_dm_top.dap.state_q                                                                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.abstractauto_q                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.abstractauto_q                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.cmd_valid_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.cmd_valid_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.cmderr_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.cmderr_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.command_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.command_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.data_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.data_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.dmcontrol_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.dmcontrol_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.havereset_q                                                                                        == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.havereset_q                                                                                         &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_rptr                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_rptr                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_wptr                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.fifo_wptr                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.storage                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.storage                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.under_rst                                                                   == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.i_fifo.gen_normal_fifo.under_rst                                                                    &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.progbuf_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.progbuf_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbaddr_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbaddr_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbcs_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbcs_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_csrs.sbdata_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_csrs.sbdata_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.fwd_rom_q                                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.fwd_rom_q                                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.gen_rom_snd_scratch.i_debug_rom.addr_q                                                              == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.gen_rom_snd_scratch.i_debug_rom.addr_q                                                               &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.halted_q                                                                                            == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.halted_q                                                                                             &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.rdata_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.rdata_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.resuming_q                                                                                          == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.resuming_q                                                                                           &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.state_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.state_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_mem.word_enable32_q                                                                                     == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_mem.word_enable32_q                                                                                      &&
        top_level_upec.top_earlgrey_1.u_dm_top.i_dm_sba.state_q                                                                                             == top_level_upec.top_earlgrey_2.u_dm_top.i_dm_sba.state_q                                                                                              &&
        top_level_upec.top_earlgrey_1.u_dm_top.rvalid                                                                                                       == top_level_upec.top_earlgrey_2.u_dm_top.rvalid                                                                                                        &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.intg_error_q                                                                           == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.intg_error_q                                                                            &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_rptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_rptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_wptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.fifo_wptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.storage                                                      == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.storage                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.under_rst                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_reqfifo.gen_normal_fifo.under_rst                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_rptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_rptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_wptr                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.fifo_wptr                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.storage                                                      == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.storage                                                       &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.under_rst                                                    == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_rspfifo.gen_normal_fifo.under_rst                                                     &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_rptr                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_rptr                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_wptr                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.fifo_wptr                                                 &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.storage                                                  == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.storage                                                   &&
        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.under_rst                                                == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_device_mem.u_sramreqfifo.gen_normal_fifo.under_rst                                                 &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.intg_err_q                                                                               == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.intg_err_q                                                                                &&
//        top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q                                                                       == top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o  == top_level_upec.top_earlgrey_2.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   &&
        top_level_upec.top_earlgrey_1.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o  == top_level_upec.top_earlgrey_2.u_dm_top.u_lc_en_sync.gen_flops.u_prim_flop_2sync.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o
    );
endfunction