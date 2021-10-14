sequence counterexample_1;
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	&& !top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_user		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_user		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	== top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence

sequence counterexample_2;
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_user		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_user		and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	== top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	and
    t ## 0 top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	&& !top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence

sequence counterexample_2_2;
    t ## 1 	top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.shadow_inputs_q[1].data_gnt	&& !top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.shadow_inputs_q[1].data_gnt;
endsequence

sequence counterexample_2_2_2;
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_waddr_wb_q      != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_waddr_wb_q      and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_wdata_wb_q      != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_wdata_wb_q      and
    t ## 1 !top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_we_wb_q        && top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.rf_we_wb_q         and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_compressed_q    && !top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_compressed_q   and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_count_q         && !top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_count_q        and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_instr_type_q    != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_instr_type_q    and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_pc_q            != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.wb_stage_i.g_writeback_stage.wb_pc_q;
endsequence

sequence counterexample_2_2_3;
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_fetch_err_o                               && !top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_fetch_err_o                   and
    t ## 1 !top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_is_compressed_id_o                       && top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_is_compressed_id_o             and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_alu_id_o                            != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_alu_id_o                 and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_c_id_o                              != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_c_id_o                   and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_id_o                                != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.instr_rdata_id_o                     and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.pc_id_o                                         != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.pc_id_o                              and
    t ## 1 top_earlgrey_1.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.gen_icache.icache_i.skid_data_q                 != top_earlgrey_2.u_rv_core_ibex.u_core.u_ibex_core.if_stage_i.gen_icache.icache_i.skid_data_q      and
    t ## 2 top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].data_be                 != top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].data_be      and
    t ## 2 top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_raddr_a              != top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_raddr_a   and
    t ## 2 top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_raddr_b              != top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_raddr_b   and
    t ## 2 top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_waddr_wb             != top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].rf_waddr_wb  and
    t ## 2 top_earlgrey_1.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].crash_dump.current_pc   != top_earlgrey_2.u_rv_core_ibex.u_core.gen_lockstep.u_ibex_lockstep.core_outputs_q[1].crash_dump.current_pc;
endsequence

sequence counterexample_6;
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_user.rsp_intg    != top_earlgrey_2.u_xbar_main.tl_cored_o.d_user.rsp_intg    and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_user.data_intg   == top_earlgrey_2.u_xbar_main.tl_cored_o.d_user.data_intg   and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	        and
    t ## 1 top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	        == top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence