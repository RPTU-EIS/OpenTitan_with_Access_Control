function no_secure_rsps_bound_to_untrusted_master_xbar_peri();
    no_secure_rsps_bound_to_untrusted_master_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_source[1:0]  != 2'b10
    );
endfunction

function no_secure_rsps_sent_to_untrusted_master_xbar_peri();
    no_secure_rsps_sent_to_untrusted_master_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart0_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart1_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart2_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart3_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c0_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c1_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c2_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pattgen_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwm_aon_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_gpio_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_device_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host0_i.d_source[2:0]          != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host1_i.d_source[2:0]          != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rv_timer_i.d_source[2:0]           != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_usbdev_i.d_source[2:0]             != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwrmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rstmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_clkmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pinmux_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ram_ret_aon_i.d_source[2:0]        != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_otp_ctrl_i.d_source[2:0]           != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_lc_ctrl_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sensor_ctrl_aon_i.d_source[2:0]    != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_alert_handler_i.d_source[2:0]      != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sram_ctrl_ret_aon_i.d_source[2:0]  != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_aon_timer_aon_i.d_source[2:0]      != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sysrst_ctrl_aon_i.d_source[2:0]    != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_adc_ctrl_aon_i.d_source[2:0]       != 3'b101   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ast_i.d_source[2:0]                != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart0_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart1_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart2_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart3_i.d_source[2:0]              != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c0_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c1_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c2_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pattgen_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwm_aon_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_gpio_i.d_source[2:0]               != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_device_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host0_i.d_source[2:0]          != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host1_i.d_source[2:0]          != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rv_timer_i.d_source[2:0]           != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_usbdev_i.d_source[2:0]             != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwrmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rstmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_clkmgr_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pinmux_aon_i.d_source[2:0]         != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ram_ret_aon_i.d_source[2:0]        != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_otp_ctrl_i.d_source[2:0]           != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_lc_ctrl_i.d_source[2:0]            != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sensor_ctrl_aon_i.d_source[2:0]    != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_alert_handler_i.d_source[2:0]      != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sram_ctrl_ret_aon_i.d_source[2:0]  != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_aon_timer_aon_i.d_source[2:0]      != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sysrst_ctrl_aon_i.d_source[2:0]    != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_adc_ctrl_aon_i.d_source[2:0]       != 3'b101   &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ast_i.d_source[2:0]                != 3'b101
        );
endfunction

function logic[2:0] fifo_depth(logic[2:0] wptr, logic[2:0] rptr);
    return wptr - rptr;
endfunction

function automatic untrusted_outstanding_less_than_4_xbar_peri();
    untrusted_outstanding_less_than_4_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding                          +
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.depth_o                       <= 4 &&
       (fifo_depth (top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q,
                    top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q)   +
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding                +
        fifo_depth (top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q,
                    top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q)   ==
        int'(top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding)                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding   == 5'd2             ||
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding   != 5'd2             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                ==
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding    == '0       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                ==
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q)               &&

        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding                          +
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.depth_o                       <= 4 &&
       (fifo_depth (top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q,
                    top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q)   +
        top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding                +
        fifo_depth (top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q,
                    top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q)   ==
        int'(top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding)                    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding   == 5'd2             ||
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding   != 5'd2             &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                ==
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                &&
        top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding    == '0       &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                ==
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q)
    );
endfunction

function automatic trusted_slaves_dont_send_rsps_without_reqs_xbar_peri();
    trusted_slaves_dont_send_rsps_without_reqs_xbar_peri = (
        (top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.num_req_outstanding  != '0       ||
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[0].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[1].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[2].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[3].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[4].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[5].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[6].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[7].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[8].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[9].d_valid               &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[10].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[11].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[12].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[13].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[14].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[15].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[16].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[17].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[18].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[19].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[20].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[21].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[22].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[23].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[24].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[25].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[26].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[27].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_d_i[28].d_valid              &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.tl_u_i[29].d_valid
        )                                                                                           &&
        (top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding   != '0   ||
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[0].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[1].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[2].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[3].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[4].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[5].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[6].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[7].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[8].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[9].d_valid            &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[10].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[11].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[12].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[13].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[14].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[15].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[16].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[17].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[18].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[19].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[20].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[21].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[22].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[23].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[24].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[25].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[26].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[27].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[28].d_valid           &&
         !top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.tl_u_i[29].d_valid
       )                                                                                            &&
       (top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.num_req_outstanding  != '0       ||
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[0].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[1].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[2].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[3].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[4].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[5].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[6].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[7].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[8].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[9].d_valid               &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[10].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[11].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[12].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[13].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[14].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[15].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[16].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[17].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[18].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[19].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[20].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[21].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[22].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[23].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[24].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[25].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[26].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[27].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_d_i[28].d_valid              &&
        !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.tl_u_i[29].d_valid
      )                                                                                           &&
      (top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding   != '0   ||
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[0].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[1].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[2].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[3].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[4].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[5].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[6].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[7].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[8].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[9].d_valid            &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[10].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[11].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[12].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[13].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[14].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[15].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[16].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[17].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[18].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[19].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[20].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[21].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[22].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[23].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[24].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[25].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[26].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[27].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_d_i[28].d_valid           &&
       !top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.tl_u_i[29].d_valid
     )
    );
endfunction

function automatic security_enabled_xbar_peri();
    security_enabled_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.slave_bits_peri_i == 29'h1fffffff
    );
endfunction

function automatic input_equivalence_xbar_peri();
    input_equivalence_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.clk_peri_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.clk_peri_i                     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.rst_peri_ni                   == top_level_upec.top_earlgrey_2.u_xbar_peri.rst_peri_ni                    &&
//        top_level_upec.top_earlgrey_1.u_xbar_peri.master_bit_peri_secure_en_i   == top_level_upec.top_earlgrey_2.u_xbar_peri.master_bit_peri_secure_en_i    &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.slave_bits_peri_i             == top_level_upec.top_earlgrey_2.u_xbar_peri.slave_bits_peri_i              &&
//        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_main_secure_i              == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_main_secure_i               &&
//        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_main_untrusted_i           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_main_untrusted_i            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart0_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart0_i                     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart1_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart1_i                     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart2_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart2_i                     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart3_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart3_i                     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c0_i                     == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c0_i                      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c1_i                     == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c1_i                      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c2_i                     == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c2_i                      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pattgen_i                  == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pattgen_i                   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwm_aon_i                  == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwm_aon_i                   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_gpio_i                     == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_gpio_i                      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_device_i               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_device_i                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host0_i                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host0_i                 &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host1_i                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host1_i                 &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rv_timer_i                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rv_timer_i                  &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_usbdev_i                   == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_usbdev_i                    &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwrmgr_aon_i               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwrmgr_aon_i                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rstmgr_aon_i               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rstmgr_aon_i                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_clkmgr_aon_i               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_clkmgr_aon_i                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pinmux_aon_i               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pinmux_aon_i                &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ram_ret_aon_i              == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ram_ret_aon_i               &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_otp_ctrl_i                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_otp_ctrl_i                  &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_lc_ctrl_i                  == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_lc_ctrl_i                   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sensor_ctrl_aon_i          == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sensor_ctrl_aon_i           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_alert_handler_i            == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_alert_handler_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sram_ctrl_ret_aon_i        == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sram_ctrl_ret_aon_i         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_aon_timer_aon_i            == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_aon_timer_aon_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sysrst_ctrl_aon_i          == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sysrst_ctrl_aon_i           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_adc_ctrl_aon_i             == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_adc_ctrl_aon_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ast_i                      == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ast_i                       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.scanmode_i                    == top_level_upec.top_earlgrey_2.u_xbar_peri.scanmode_i
        );
endfunction

function automatic output_equivalence_xbar_peri();
    output_equivalence_xbar_peri = (
    //    top_level_upec.top_earlgrey_1.u_xbar_peri.tl_main_secure_o          == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_main_secure_o       &&
    //    top_level_upec.top_earlgrey_1.u_xbar_peri.tl_main_untrusted_o       == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_main_untrusted_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart0_o                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart0_o             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart1_o                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart1_o             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart2_o                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart2_o             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_uart3_o                == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_uart3_o             &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c0_o                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c0_o              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c1_o                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c1_o              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_i2c2_o                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_i2c2_o              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pattgen_o              == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pattgen_o           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwm_aon_o              == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwm_aon_o           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_gpio_o                 == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_gpio_o              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_device_o           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_device_o        &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host0_o            == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host0_o         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_spi_host1_o            == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_spi_host1_o         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rv_timer_o             == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rv_timer_o          &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_usbdev_o               == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_usbdev_o            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pwrmgr_aon_o           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pwrmgr_aon_o        &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_rstmgr_aon_o           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_rstmgr_aon_o        &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_clkmgr_aon_o           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_clkmgr_aon_o        &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_pinmux_aon_o           == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_pinmux_aon_o        &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ram_ret_aon_o          == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ram_ret_aon_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_otp_ctrl_o             == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_otp_ctrl_o          &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_lc_ctrl_o              == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_lc_ctrl_o           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sensor_ctrl_aon_o      == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sensor_ctrl_aon_o   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_alert_handler_o        == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_alert_handler_o     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sram_ctrl_ret_aon_o    == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sram_ctrl_ret_aon_o &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_aon_timer_aon_o        == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_aon_timer_aon_o     &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_sysrst_ctrl_aon_o      == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_sysrst_ctrl_aon_o   &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_adc_ctrl_aon_o         == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_adc_ctrl_aon_o      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.tl_ast_o                  == top_level_upec.top_earlgrey_2.u_xbar_peri.tl_ast_o
    );
endfunction

function automatic micro_soc_state_equivalence_xbar_peri();
    micro_soc_state_equivalence_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.dev_select_outstanding        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.dev_select_outstanding         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_opcode           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_opcode            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_req_pending      == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_req_pending       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_rsp_pending      == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_rsp_pending       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_size             == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_size              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_source           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_source            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.num_req_outstanding           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.num_req_outstanding            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding     == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding      &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending   == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending    &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending   == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending    &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size          == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size           &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding
    );
endfunction

function automatic soc_state_equivalence_xbar_peri();
    soc_state_equivalence_xbar_peri = (
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.dev_select_outstanding        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.dev_select_outstanding         &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_opcode           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_opcode            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_req_pending      == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_req_pending       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_rsp_pending      == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_rsp_pending       &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_size             == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_size              &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.err_resp.err_source           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.err_resp.err_source            &&
        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_secure.num_req_outstanding           == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_secure.num_req_outstanding  //          &&
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding     == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.dev_select_outstanding      &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_opcode         &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending   == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_req_pending    &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending   == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_rsp_pending //   &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size          == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_size           &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.err_resp.err_source //        &&    //
//        top_level_upec.top_earlgrey_1.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding        == top_level_upec.top_earlgrey_2.u_xbar_peri.u_s1n_30_untrusted.num_req_outstanding               //
    );
endfunction