function automatic black_box_input_equivalence_ram_ret_aon();
    black_box_input_equivalence_ram_ret_aon = (
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o
    );
endfunction

function automatic black_box_output_equivalence_ram_ret_aon();
    black_box_output_equivalence_ram_ret_aon = (
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.addr_i     == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.addr_i  &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.cfg_i      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.cfg_i   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.clk_i      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.clk_i   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.req_i      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.req_i   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.wdata_i    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.wdata_i &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.wmask_i    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.wmask_i &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.write_i    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.write_i
    );
endfunction

function automatic input_equivalence_ram_ret_aon();
    input_equivalence_ram_ret_aon = (
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.clk_i         == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.clk_i          &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rst_ni        == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rst_ni         &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.key_valid_i   == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.key_valid_i    &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.key_i         == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.key_i          &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.nonce_i       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.nonce_i        &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.init_seed_i   == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.init_seed_i    &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.init_req_i    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.init_req_i     &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.req_i         == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.req_i          &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.write_i       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.write_i        &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.addr_i        == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.addr_i         &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wdata_i       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wdata_i        &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wmask_i       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wmask_i        &&
//        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.intg_error_i  == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.intg_error_i   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.cfg_i         == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.cfg_i
    );
endfunction

// function automatic output_equivalence_ram_ret_aon();
//     output_equivalence_ram_ret_aon = (
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.init_ack_o    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.init_ack_o &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.gnt_o         == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.gnt_o      &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rdata_o       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rdata_o    &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rvalid_o      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rvalid_o   &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rerror_o      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rerror_o   &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.raddr_o       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.raddr_o    &&
// //        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.intg_error_o  == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.intg_error_o
//     );
// endfunction

function automatic micro_soc_state_equivalence_ram_ret_aon();
    micro_soc_state_equivalence_ram_ret_aon = (
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.addr_cnt_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.addr_cnt_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.addr_collision_q                                              == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.addr_collision_q                                   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.data_state_middle_q              == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.data_state_middle_q   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.gen_data_reg.valid_q             == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.gen_data_reg.valid_q  &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.init_req_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.init_req_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.intg_err_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.intg_err_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.raddr_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.raddr_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rvalid_q                                                      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rvalid_q                                           &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.cnt_q                                  == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.cnt_q                       &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.perturbed_q                            == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.perturbed_q                 &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.lfsr_q                                                 == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.lfsr_q                                      &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.rvalid_sram_q                               == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.rvalid_sram_q                    &&
        //top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.mem        == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.mem &&
        //top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.waddr_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.waddr_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wdata_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wdata_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wdata_scr_q                                                   == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wdata_scr_q                                        &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wmask_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wmask_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.write_en_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.write_en_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.write_pending_q                                               == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.write_pending_q
    );
endfunction

function automatic soc_state_equivalence_ram_ret_aon();
    soc_state_equivalence_ram_ret_aon = (
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.addr_cnt_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.addr_cnt_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.addr_collision_q                                              == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.addr_collision_q                                   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.data_state_middle_q              == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.data_state_middle_q   &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.gen_data_reg.valid_q             == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.gen_par_scr[0].u_prim_prince.gen_data_reg.valid_q  &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.init_req_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.init_req_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.intg_err_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.intg_err_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.raddr_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.raddr_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.rvalid_q                                                      == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.rvalid_q                                           &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.cnt_q                                  == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.cnt_q                       &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.perturbed_q                            == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.gen_max_len_sva.perturbed_q                 &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_lfsr.lfsr_q                                                 == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_lfsr.lfsr_q                                      &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.rvalid_sram_q                               == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.rvalid_sram_q                    &&
        //top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.mem        == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.mem &&
        //top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.u_prim_ram_1p_adv.u_mem.gen_generic.u_impl_generic.rdata_o &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.waddr_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.waddr_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wdata_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wdata_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wdata_scr_q                                                   == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wdata_scr_q                                        &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.wmask_q                                                       == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.wmask_q                                            &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.write_en_q                                                    == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.write_en_q                                         &&
        top_level_upec.top_earlgrey_1.u_ram1p_ram_ret_aon.write_pending_q                                               == top_level_upec.top_earlgrey_2.u_ram1p_ram_ret_aon.write_pending_q
    );
endfunction