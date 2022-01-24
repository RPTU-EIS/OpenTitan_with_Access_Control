function automatic primary_input_equivalence();
    primary_input_equivalence = (
        top_level_upec.top_earlgrey_1.rst_ni                        == top_level_upec.top_earlgrey_2.rst_ni                         &&
        top_level_upec.top_earlgrey_1.mio_in_i                      == top_level_upec.top_earlgrey_2.mio_in_i                       &&
        top_level_upec.top_earlgrey_1.dio_in_i                      == top_level_upec.top_earlgrey_2.dio_in_i                       &&
        top_level_upec.top_earlgrey_1.adc_rsp_i                     == top_level_upec.top_earlgrey_2.adc_rsp_i                      &&
        top_level_upec.top_earlgrey_1.ast_edn_req_i                 == top_level_upec.top_earlgrey_2.ast_edn_req_i                  &&
        top_level_upec.top_earlgrey_1.ram_1p_cfg_i                  == top_level_upec.top_earlgrey_2.ram_1p_cfg_i                   &&
        top_level_upec.top_earlgrey_1.ram_2p_cfg_i                  == top_level_upec.top_earlgrey_2.ram_2p_cfg_i                   &&
        top_level_upec.top_earlgrey_1.rom_cfg_i                     == top_level_upec.top_earlgrey_2.rom_cfg_i                      &&
        top_level_upec.top_earlgrey_1.clk_main_i                    == top_level_upec.top_earlgrey_2.clk_main_i                     &&
        top_level_upec.top_earlgrey_1.clk_io_i                      == top_level_upec.top_earlgrey_2.clk_io_i                       &&
        top_level_upec.top_earlgrey_1.clk_usb_i                     == top_level_upec.top_earlgrey_2.clk_usb_i                      &&
        top_level_upec.top_earlgrey_1.clk_aon_i                     == top_level_upec.top_earlgrey_2.clk_aon_i                      &&
        top_level_upec.top_earlgrey_1.ast_clk_byp_ack_i             == top_level_upec.top_earlgrey_2.ast_clk_byp_ack_i              &&
        top_level_upec.top_earlgrey_1.flash_bist_enable_i           == top_level_upec.top_earlgrey_2.flash_bist_enable_i            &&
        top_level_upec.top_earlgrey_1.flash_power_down_h_i          == top_level_upec.top_earlgrey_2.flash_power_down_h_i           &&
        top_level_upec.top_earlgrey_1.flash_power_ready_h_i         == top_level_upec.top_earlgrey_2.flash_power_ready_h_i          &&
        top_level_upec.top_earlgrey_1.es_rng_rsp_i                  == top_level_upec.top_earlgrey_2.es_rng_rsp_i                   &&
        top_level_upec.top_earlgrey_1.ast_tl_rsp_i                  == top_level_upec.top_earlgrey_2.ast_tl_rsp_i                   &&
        top_level_upec.top_earlgrey_1.dft_hold_tap_sel_i            == top_level_upec.top_earlgrey_2.dft_hold_tap_sel_i             &&
        top_level_upec.top_earlgrey_1.pwrmgr_ast_rsp_i              == top_level_upec.top_earlgrey_2.pwrmgr_ast_rsp_i               &&
        top_level_upec.top_earlgrey_1.otp_ctrl_otp_ast_pwr_seq_h_i  == top_level_upec.top_earlgrey_2.otp_ctrl_otp_ast_pwr_seq_h_i   &&
        top_level_upec.top_earlgrey_1.sensor_ctrl_ast_alert_req_i   == top_level_upec.top_earlgrey_2.sensor_ctrl_ast_alert_req_i    &&
        top_level_upec.top_earlgrey_1.sensor_ctrl_ast_status_i      == top_level_upec.top_earlgrey_2.sensor_ctrl_ast_status_i       &&
        top_level_upec.top_earlgrey_1.ast2pinmux_i                  == top_level_upec.top_earlgrey_2.ast2pinmux_i                   &&
        top_level_upec.top_earlgrey_1.ast_init_done_i               == top_level_upec.top_earlgrey_2.ast_init_done_i                &&
        top_level_upec.top_earlgrey_1.flash_test_mode_a_io          == top_level_upec.top_earlgrey_2.flash_test_mode_a_io           &&
        top_level_upec.top_earlgrey_1.flash_test_voltage_h_io       == top_level_upec.top_earlgrey_2.flash_test_voltage_h_io        &&
        top_level_upec.top_earlgrey_1.otp_ext_voltage_h_io          == top_level_upec.top_earlgrey_2.otp_ext_voltage_h_io           &&
        top_level_upec.top_earlgrey_1.scan_rst_ni                   == top_level_upec.top_earlgrey_2.scan_rst_ni                    &&
        top_level_upec.top_earlgrey_1.scan_en_i                     == top_level_upec.top_earlgrey_2.scan_en_i                      &&
        top_level_upec.top_earlgrey_1.scanmode_i                    == top_level_upec.top_earlgrey_2.scanmode_i
    );
endfunction

 function automatic primary_output_equivalence();
    primary_output_equivalence = (
        // top_level_upec.top_earlgrey_1.mio_out_o                     == top_level_upec.top_earlgrey_2.mio_out_o                      &&
        // top_level_upec.top_earlgrey_1.mio_oe_o                      == top_level_upec.top_earlgrey_2.mio_oe_o                       &&
        // top_level_upec.top_earlgrey_1.dio_out_o                     == top_level_upec.top_earlgrey_2.dio_out_o                      &&
        // top_level_upec.top_earlgrey_1.dio_oe_o                      == top_level_upec.top_earlgrey_2.dio_oe_o                       &&
        // top_level_upec.top_earlgrey_1.mio_attr_o                    == top_level_upec.top_earlgrey_2.mio_attr_o                     &&
        // top_level_upec.top_earlgrey_1.dio_attr_o                    == top_level_upec.top_earlgrey_2.dio_attr_o                     &&
        // top_level_upec.top_earlgrey_1.adc_req_o                     == top_level_upec.top_earlgrey_2.adc_req_o                      &&
        // top_level_upec.top_earlgrey_1.ast_edn_rsp_o                 == top_level_upec.top_earlgrey_2.ast_edn_rsp_o                  &&
        // top_level_upec.top_earlgrey_1.ast_lc_dft_en_o               == top_level_upec.top_earlgrey_2.ast_lc_dft_en_o                &&
        // top_level_upec.top_earlgrey_1.clk_main_jitter_en_o          == top_level_upec.top_earlgrey_2.clk_main_jitter_en_o           &&
        // top_level_upec.top_earlgrey_1.ast_clk_byp_req_o             == top_level_upec.top_earlgrey_2.ast_clk_byp_req_o              &&
        // top_level_upec.top_earlgrey_1.flash_alert_o                 == top_level_upec.top_earlgrey_2.flash_alert_o                  &&
        // top_level_upec.top_earlgrey_1.es_rng_req_o                  == top_level_upec.top_earlgrey_2.es_rng_req_o                   &&
        // top_level_upec.top_earlgrey_1.es_rng_fips_o                 == top_level_upec.top_earlgrey_2.es_rng_fips_o                  &&
        top_level_upec.top_earlgrey_1.ast_tl_req_o                  == top_level_upec.top_earlgrey_2.ast_tl_req_o          //         &&
        // top_level_upec.top_earlgrey_1.dft_strap_test_o              == top_level_upec.top_earlgrey_2.dft_strap_test_o               &&
        // top_level_upec.top_earlgrey_1.pwrmgr_ast_req_o              == top_level_upec.top_earlgrey_2.pwrmgr_ast_req_o               &&
        // top_level_upec.top_earlgrey_1.otp_ctrl_otp_ast_pwr_seq_o    == top_level_upec.top_earlgrey_2.otp_ctrl_otp_ast_pwr_seq_o     &&
        // top_level_upec.top_earlgrey_1.otp_alert_o                   == top_level_upec.top_earlgrey_2.otp_alert_o                    &&
        // top_level_upec.top_earlgrey_1.sensor_ctrl_ast_alert_rsp_o   == top_level_upec.top_earlgrey_2.sensor_ctrl_ast_alert_rsp_o    &&
        // top_level_upec.top_earlgrey_1.usbdev_usb_ref_val_o          == top_level_upec.top_earlgrey_2.usbdev_usb_ref_val_o           &&
        // top_level_upec.top_earlgrey_1.usbdev_usb_ref_pulse_o        == top_level_upec.top_earlgrey_2.usbdev_usb_ref_pulse_o         &&
        // top_level_upec.top_earlgrey_1.clks_ast_o                    == top_level_upec.top_earlgrey_2.clks_ast_o                     &&
        // top_level_upec.top_earlgrey_1.rsts_ast_o                    == top_level_upec.top_earlgrey_2.rsts_ast_o
    );
endfunction