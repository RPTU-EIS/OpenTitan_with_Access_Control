/* sequence counterexample_1;
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	    && !top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_user		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_user		    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	    and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	    == top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence

sequence counterexample_2;
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_user		== top_earlgrey_2.u_xbar_main.tl_cored_o.d_user		and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	    == top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	and
    t ## 0  top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	    && !top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence */

/* sequence counterexample_2_2;
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
endsequence */

/* sequence counterexample_6;
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_valid 	            == top_earlgrey_2.u_xbar_main.tl_cored_o.d_valid	        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_opcode	            == top_earlgrey_2.u_xbar_main.tl_cored_o.d_opcode	        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_param	            == top_earlgrey_2.u_xbar_main.tl_cored_o.d_param	        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_source	            == top_earlgrey_2.u_xbar_main.tl_cored_o.d_source	        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_size		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_size		        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_sink		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_sink		        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_data		        == top_earlgrey_2.u_xbar_main.tl_cored_o.d_data		        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_user.rsp_intg       != top_earlgrey_2.u_xbar_main.tl_cored_o.d_user.rsp_intg    and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_user.data_intg      == top_earlgrey_2.u_xbar_main.tl_cored_o.d_user.data_intg   and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.d_error	            == top_earlgrey_2.u_xbar_main.tl_cored_o.d_error	        and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_cored_o.a_ready	            == top_earlgrey_2.u_xbar_main.tl_cored_o.a_ready;
endsequence

sequence counterexample_9;
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_valid           == top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_valid           and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_opcode          != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_opcode          and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_param           == top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_param           and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_size            != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_size            and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_source          != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_source          and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_address         != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_address         and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_mask            == top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_mask            and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_data            != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_data            and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_user.rsvd       != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_user.rsvd       and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_user.tl_type    != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_user.tl_type    and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_user.cmd_intg   != top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_user.cmd_intg   and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.a_user.data_intg  == top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.a_user.data_intg  and
    t ## 1  top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o.d_ready           == top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o.d_ready;
endsequence

sequence counterexample_9_1;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart0_o                != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart0_o             and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart1_o                != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart1_o             and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart2_o                != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart2_o             and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart3_o                != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart3_o             and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c0_o                 != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c0_o              and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c1_o                 != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c1_o              and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c2_o                 != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c2_o              and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pattgen_o              != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pattgen_o           and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwm_aon_o              != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwm_aon_o           and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_gpio_o                 != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_gpio_o              and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_device_o           != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_device_o        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host0_o            != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host0_o         and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host1_o            != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host1_o         and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rv_timer_o             != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rv_timer_o          and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_usbdev_o               != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_usbdev_o            and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwrmgr_aon_o           != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwrmgr_aon_o        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rstmgr_aon_o           != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rstmgr_aon_o        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_clkmgr_aon_o           != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_clkmgr_aon_o        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pinmux_aon_o           != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pinmux_aon_o        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ram_ret_aon_o          != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ram_ret_aon_o       and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_otp_ctrl_o             != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_otp_ctrl_o          and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_lc_ctrl_o              != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_lc_ctrl_o           and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sensor_ctrl_aon_o      != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sensor_ctrl_aon_o   and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_alert_handler_o        != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_alert_handler_o     and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sram_ctrl_ret_aon_o    != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sram_ctrl_ret_aon_o and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_aon_timer_aon_o        != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_aon_timer_aon_o     and
//    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sysrst_ctrl_aon_o      != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sysrst_ctrl_aon_o   and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_adc_ctrl_aon_o         != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_adc_ctrl_aon_o      and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ast_o                  != top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ast_o;
endsequence

sequence counterexample_9_1_1;
    t ## 1 top_level_upec.top_earlgrey_1.u_tl_adapter_ram_ret_aon.req_type_o    != top_level_upec.top_earlgrey_2.u_tl_adapter_ram_ret_aon.req_type_o;
endsequence */
/*
 sequence counterexample_10;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding   != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding    and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending  and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size        != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size         and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding      != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding;
endsequence

sequence counterexample_10_2;
    t ## 1 top_level_upec.top_earlgrey_1.u_xbar_main.tl_dm_sba_o.d_valid    && !top_level_upec.top_earlgrey_2.u_xbar_main.tl_dm_sba_o.d_valid;
endsequence

sequence counterexample_11;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding   == 5'h10                                                                        and
    t ## 1  top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding   != 5'h10                                                                        and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending  and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size        != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size         and
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding      == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding + 1'b1;
endsequence

sequence counterexample_11_3;
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr ==  top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 1'b1  and
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage   !=  top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage;
endsequence

sequence counterexample_1_1_2;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o   != top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o;
endsequence
*/

/* sequence counterexample_2_1;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o                           != top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o                            or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q    or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q + 1'b1  or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding               != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding                or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding + 1'b1;
endsequence

sequence counterexample_2_2_3;
            counterexample_2_1  and
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_2_3_3;
            counterexample_2_2_3    and
    t ## 3  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_2_4_3;
            counterexample_2_3_3                                                                                                                                                                and
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding + 1'b1  or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode        != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending   && !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending   or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size          != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size           or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source        != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q    or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q + 1'b1  or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding     != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding;
endsequence

sequence counterexample_2_5_3;
            counterexample_2_4_3                                                                                                                                                                                                                                                                                        and
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                               != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                                or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q + 1'b1                                                              or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                        != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.storage;
endsequence

sequence counterexample_2_6_3;
            counterexample_2_5_3                                                                                                                                                                                                                                                                                        and
    t ## 6  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    or
    t ## 6  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_2_7_3;
            counterexample_2_6_3                                                                                                                                                                                                                                                                                        and
    t ## 7  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    or
    t ## 7  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q + 1'b1                                                         or
    t ## 7  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending                                                               && !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending;
endsequence

sequence counterexample_2_8_3;
            counterexample_2_7_3                                                                                                                                                                                and
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 1'b1   or
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage   != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage            or
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q       != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q                or
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q            == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q + 1'b1              or
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr + 1'b1;
endsequence

sequence counterexample_2_9_3;
            counterexample_2_8_3    and
    t ## 9  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_2_10_2;
            counterexample_2_9_3    and
    t ## 10 top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_2_11_2;
            counterexample_2_10_2   and
    t ## 11 top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q +1'b1;
endsequence

sequence counterexample_2_12_2;
            counterexample_2_11_2                                                                                                                                           and
    t ## 12 !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending    && top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending  or
    t ## 12 top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_opcode          != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_opcode       or
    t ## 12 top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size            != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size;
endsequence

sequence counterexample_2_13_2;
            counterexample_2_12_2   and
    t ## 13 top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_source  != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_source;
endsequence */

/* sequence counterexample_3_1_2;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr && top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr + 1'b1;
endsequence

sequence counterexample_4_1_2;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding                      != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding                       or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr  or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage   != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage    or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.tl_dm_sba_o                                       != top_level_upec.top_earlgrey_2.u_xbar_main.tl_dm_sba_o;
endsequence

sequence counterexample_4_2_2;
            counterexample_4_1_2                                                                                                                                                                        and
    t ## 2  top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q               != top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.outstanding_reqs_q                or
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr  or
    t ## 2  top_level_upec.top_earlgrey_1.u_dm_top.tl_adapter_host_sba.intg_err_q                       != top_level_upec.top_earlgrey_2.u_dm_top.tl_adapter_host_sba.intg_err_q;
endsequence */

sequence counterexample_5_1;
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.storage            != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.storage             or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q    or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q        != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q         or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding                  != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding                   or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending             != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending              or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding               != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding                or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size                    != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size                     or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_source                  != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_source                   or
    t ## 1  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_opcode                  != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_opcode;
endsequence

sequence counterexample_5_2;
            counterexample_5_1                                                                                                                                                                                                                                  and
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                         != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr  or
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage                                                           != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage    or
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                         != top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr  or
    t ## 2  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_3;
            counterexample_5_2  and
    t ## 3  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_4;
            counterexample_5_3                                                                                                                                                                  and
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q    or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q        != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding        != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode        != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending   != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending    or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source        != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source         or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding     != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding      or
    t ## 4  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size          != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size;
endsequence

sequence counterexample_5_5;
            counterexample_5_4                                                                                                                                                                                                                              and
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                               != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q    or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                    != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q         or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                        != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.storage             or
    t ## 5  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_6;
            counterexample_5_5                                                                                                                                                                                                                                                                                          and
    t ## 6  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    or
    t ## 6  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    or
    t ## 6  top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending                                                               != top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending;
endsequence

sequence counterexample_5_7;
            counterexample_5_6                                                                                                                                                                                                                              and
    t ## 7  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                               != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q    or
    t ## 7  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_8;
            counterexample_5_7                                                                                                                                                                  and
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q    or
    t ## 8  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q        != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q;
endsequence

sequence counterexample_5_9;
            counterexample_5_8  and
    t ## 9  top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_10;
            counterexample_5_9  and
    t ## 10 top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o;
endsequence

sequence counterexample_5_11;
            counterexample_5_10 and
    t ## 11 top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q   != top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q;
endsequence