function automatic under_rst_is_low_xbar_main();
    under_rst_is_low_xbar_main = (
        !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst    &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst
    );
endfunction

function no_secure_rsps_sent_to_untrusted_master_xbar_main();
    no_secure_rsps_sent_to_untrusted_master_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_untrusted_i.d_source[1:0]   != 1'b10
    );
endfunction

function no_secure_rsps_bound_to_untrusted_master_xbar_main();
    no_secure_rsps_bound_to_untrusted_master_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage[0][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage[1][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage[2][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage[3][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage[0][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage[1][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage[2][50:49]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage[3][50:49]  != 2'b10    &&

        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage[0][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage[1][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage[2][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage[3][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage[0][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage[1][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage[2][91:90]  != 2'b10    &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage[3][91:90]  != 2'b10
    );
endfunction

function automatic rspfifo_less_or_equal_num_req_xbar_main();
    rspfifo_less_or_equal_num_req_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.depth_o       +
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.wdepth_o   <=
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding          &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.depth_o       +
        top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.wdepth_o   <=
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding
    );
endfunction

function automatic trusted_slaves_dont_send_rsps_without_reqs_xbar_main();
    trusted_slaves_dont_send_rsps_without_reqs_xbar_main = (
        (top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.num_req_outstanding != '0   ||
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.tl_d_i[0].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.tl_d_i[1].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.tl_d_i[2].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.tl_d_i[3].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.tl_u_i[4].d_valid
        )                                                                               &&
        (top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.num_req_outstanding != '0   ||
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[0].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[1].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[2].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[3].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[4].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[5].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[6].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[7].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[8].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[9].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[10].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[11].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[12].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[13].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[14].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[15].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[16].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[17].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[18].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[19].d_valid         &&
//         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_d_i[20].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.tl_u_i[21].d_valid
        )                                                                               &&
        (top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding != '0   ||
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[0].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[1].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[2].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[3].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[4].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[5].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[6].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[7].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[8].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[9].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[10].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[11].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[12].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[13].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[14].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[15].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[16].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[17].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[18].d_valid         &&
//         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_d_i[19].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.tl_u_i[20].d_valid
        )                                                                               &&
        (top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding  != '0   ||
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[0].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[1].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[2].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[3].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[4].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[5].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[6].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[7].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[8].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[9].d_valid          &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[10].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[11].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[12].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[13].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[14].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_d_i[15].d_valid         &&
         !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_u_i[16].d_valid
        )                                                                               &&
        (top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.num_req_outstanding != '0   ||
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.tl_d_i[0].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.tl_d_i[1].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.tl_d_i[2].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.tl_d_i[3].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.tl_u_i[4].d_valid
       )                                                                                &&
       (top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.num_req_outstanding != '0    ||
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[0].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[1].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[2].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[3].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[4].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[5].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[6].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[7].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[8].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[9].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[10].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[11].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[12].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[13].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[14].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[15].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[16].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[17].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[18].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[19].d_valid         &&
//         !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_d_i[20].d_valid         &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.tl_u_i[21].d_valid
       )                                                                                &&
       (top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding != '0    ||
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[0].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[1].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[2].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[3].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[4].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[5].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[6].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[7].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[8].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[9].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[10].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[11].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[12].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[13].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[14].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[15].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[16].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[17].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[18].d_valid         &&
//         !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_d_i[19].d_valid         &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.tl_u_i[20].d_valid
       )                                                                                &&
       (top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding  != '0   ||
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[0].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[1].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[2].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[3].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[4].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[5].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[6].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[7].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[8].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[9].d_valid           &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[10].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[11].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[12].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[13].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[14].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_d_i[15].d_valid          &&
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_u_i[16].d_valid
       )
    );
endfunction

function automatic untrusted_master_cannot_stall_xbar_main();
    untrusted_master_cannot_stall_xbar_main = (
       (!top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.full ||
        !top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.tl_h_o.d_valid)                     &&
       (!top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.full ||
        !top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.tl_h_o.d_valid)
   );
endfunction
  
  
  // Algorithm walks up from 0..N-1 then flips the upper bit and walks down from N-1 to 0.
function automatic [3:0] gray2dec(input logic [3:0] grayval);
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
endfunction

function automatic async_fifo_ptrs_invariant(logic [2:0] wptr_q, wptr_int_gray, wptr_sync, rptr_q, rptr_int_gray, rptr_sync, rptr_sync_q, rptr_gray, wptr_gray);
    
    logic [2:0] wptr_int = gray2dec(wptr_int_gray);
    logic [2:0] rptr_int = gray2dec(rptr_int_gray);

    async_fifo_ptrs_invariant = (
        wptr_q - wptr_int       <= 3'h4                 &&
        wptr_q - wptr_sync      <= 3'h4                 &&
        wptr_q - rptr_q         <= 3'h4                 &&
        wptr_q - rptr_int       <= 3'h4                 &&
        wptr_q - rptr_sync      <= 3'h4                 &&
        wptr_q - rptr_sync_q    <= 3'h4                 &&
        wptr_int - wptr_sync    <= 3'h4                 &&
        wptr_int - rptr_q       <= 3'h4                 &&
        wptr_int - rptr_int     <= 3'h4                 &&
        wptr_int - rptr_sync    <= 3'h4                 &&
        wptr_int - rptr_sync_q  <= 3'h4                 &&
        wptr_sync - rptr_q      <= 3'h4                 &&
        wptr_sync - rptr_int    <= 3'h4                 &&
        wptr_sync - rptr_sync   <= 3'h4                 &&
        wptr_sync - rptr_sync_q <= 3'h4                 &&
        rptr_q - rptr_int       <= 3'h4                 &&
        rptr_q - rptr_sync      <= 3'h4                 &&
        rptr_q - rptr_sync_q    <= 3'h4                 &&
        rptr_int - rptr_sync    <= 3'h4                 &&
        rptr_int - rptr_sync_q  <= 3'h4                 &&
        rptr_sync - rptr_sync_q <= 3'h4                 &&
        wptr_q - wptr_int       <= wptr_q - wptr_sync   &&
        wptr_q - wptr_sync      <= wptr_q - rptr_q      &&
        wptr_q - rptr_q         <= wptr_q - rptr_int    &&
        wptr_q - rptr_int       <= wptr_q - rptr_sync   &&
        wptr_q - rptr_sync      <= wptr_q - rptr_sync_q &&
        gray2dec(rptr_gray)     == rptr_q               &&
        gray2dec(wptr_gray)     == wptr_q
    );
endfunction

function automatic async_fifo_flops_legal_xbar_main();
    async_fifo_flops_legal_xbar_main = (
        async_fifo_ptrs_invariant(
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_gray_q
        )   &&
        async_fifo_ptrs_invariant(
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_gray_q
        )   &&
        async_fifo_ptrs_invariant(
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q
        )   &&
        async_fifo_ptrs_invariant(
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.intq,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_combi,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q,
            top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q
        )
    );
endfunction

function automatic fifo_ptrs_have_legal_values_xbar_main();
    fifo_ptrs_have_legal_values_xbar_main = ( 
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_rptr         != top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr         != top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr   != top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr + 2'b1 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr         != top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 2'h1       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr         != top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 2'h2       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr         != top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr + 2'h3
    );
endfunction

function automatic debug_module_is_off_xbar_main();
    debug_module_is_off_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_dm_sba_i.a_valid   == 1'b0 &&
        top_level_upec.top_earlgrey_2.u_xbar_main.tl_dm_sba_i.a_valid   == 1'b0
    );
endfunction

function automatic debug_module_has_been_off_xbar_main();
    debug_module_has_been_off_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding  == 9'h000       &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding  == 9'h000       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.empty &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.empty &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.empty &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.empty
    );
endfunction

function automatic no_outstanding_reqs_to_untrusted_device_xbar_main();
    no_outstanding_reqs_to_untrusted_device_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.dev_select_outstanding           != 6'h14        &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.dev_select_outstanding           != 6'h14        &&
       (top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.dev_select_outstanding           != 6'h13        &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.dev_select_outstanding           != 6'h13        ||
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding              == '0           &&
        top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding              == '0)
    );
endfunction

function automatic no_new_reqs_to_untrusted_device_xbar_main();
    no_new_reqs_to_untrusted_device_xbar_main = (
        !((top_level_upec.top_earlgrey_1.u_xbar_main.tl_cored_i.a_address  & 32'hfffff000)  == 32'h40300000 &&
          top_level_upec.top_earlgrey_1.u_xbar_main.tl_cored_i.a_valid)                                     &&
        !((top_level_upec.top_earlgrey_2.u_xbar_main.tl_cored_i.a_address  & 32'hfffff000)  == 32'h40300000 &&
          top_level_upec.top_earlgrey_2.u_xbar_main.tl_cored_i.a_valid)
    );
endfunction

function automatic security_enabled_xbar_main();
    security_enabled_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.master_bits_i == 1'b0 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.slave_bits_i  == 19'h7fffe
    );
endfunction

function automatic untrusted_slave_valid_input_equivalence_xbar_main();
    untrusted_slave_valid_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_valid  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_valid   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_opcode == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_opcode  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_param  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_param   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_size   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_size    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_source == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_source  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_sink   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_sink    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_data   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_data    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_user   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_user    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.d_error  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.d_error
    );
endfunction

function automatic untrusted_slave_ready_input_equivalence_xbar_main();
    untrusted_slave_ready_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i.a_ready  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i.a_ready
    );
endfunction

function automatic untrusted_slave_input_equivalence_xbar_main();
    untrusted_slave_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i
    );
endfunction

function automatic untrusted_master_valid_input_equivalence_xbar_main();
    untrusted_master_valid_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_valid      == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_valid   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_opcode     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_opcode  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_param      == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_param   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_size       == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_size    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_source     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_source  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_address    == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_address &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_mask       == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_mask    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_data       == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_data    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.a_user       == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.a_user
    );
endfunction

function automatic untrusted_master_ready_input_equivalence_xbar_main();
    untrusted_master_ready_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i.d_ready  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i.d_ready
    );
endfunction

function automatic untrusted_master_input_equivalence_xbar_main();
    untrusted_master_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i
    );
endfunction

function automatic untrusted_input_equivalence_xbar_main();
    untrusted_input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_m_i  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_m_i   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_untrusted_s_i  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_untrusted_s_i
    );
endfunction

function automatic input_equivalence_xbar_main();
    input_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.clk_main_i            == top_level_upec.top_earlgrey_2.u_xbar_main.clk_main_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.clk_fixed_i           == top_level_upec.top_earlgrey_2.u_xbar_main.clk_fixed_i            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.rst_main_ni           == top_level_upec.top_earlgrey_2.u_xbar_main.rst_main_ni            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.rst_fixed_ni          == top_level_upec.top_earlgrey_2.u_xbar_main.rst_fixed_ni           &&
        top_level_upec.top_earlgrey_1.u_xbar_main.master_bits_i         == top_level_upec.top_earlgrey_2.u_xbar_main.master_bits_i          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.slave_bits_i          == top_level_upec.top_earlgrey_2.u_xbar_main.slave_bits_i           &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_corei_i            == top_level_upec.top_earlgrey_2.u_xbar_main.tl_corei_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_cored_i            == top_level_upec.top_earlgrey_2.u_xbar_main.tl_cored_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_dm_sba_i           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_dm_sba_i            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rom_ctrl__rom_i    == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rom_ctrl__rom_i     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rom_ctrl__regs_i   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rom_ctrl__regs_i    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_debug_mem_i        == top_level_upec.top_earlgrey_2.u_xbar_main.tl_debug_mem_i         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_ram_main_i         == top_level_upec.top_earlgrey_2.u_xbar_main.tl_ram_main_i          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_eflash_i           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_eflash_i            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_secure_i      == top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_secure_i       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_untrusted_i   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_untrusted_i    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_flash_ctrl__core_i == top_level_upec.top_earlgrey_2.u_xbar_main.tl_flash_ctrl__core_i  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_flash_ctrl__prim_i == top_level_upec.top_earlgrey_2.u_xbar_main.tl_flash_ctrl__prim_i  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_hmac_i             == top_level_upec.top_earlgrey_2.u_xbar_main.tl_hmac_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_kmac_i             == top_level_upec.top_earlgrey_2.u_xbar_main.tl_kmac_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_aes_i              == top_level_upec.top_earlgrey_2.u_xbar_main.tl_aes_i               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_entropy_src_i      == top_level_upec.top_earlgrey_2.u_xbar_main.tl_entropy_src_i       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_csrng_i            == top_level_upec.top_earlgrey_2.u_xbar_main.tl_csrng_i             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_edn0_i             == top_level_upec.top_earlgrey_2.u_xbar_main.tl_edn0_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_edn1_i             == top_level_upec.top_earlgrey_2.u_xbar_main.tl_edn1_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rv_plic_i          == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rv_plic_i           &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_otbn_i             == top_level_upec.top_earlgrey_2.u_xbar_main.tl_otbn_i              &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_keymgr_i           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_keymgr_i            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_sram_ctrl_main_i   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_sram_ctrl_main_i    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_bus_ctrl_i         == top_level_upec.top_earlgrey_2.u_xbar_main.tl_bus_ctrl_i
        );
endfunction

function automatic output_equivalence_xbar_main();
    output_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.master_bit_peri_secure_en_o   == top_level_upec.top_earlgrey_2.u_xbar_main.master_bit_peri_secure_en_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_corei_o                    == top_level_upec.top_earlgrey_2.u_xbar_main.tl_corei_o                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_cored_o                    == top_level_upec.top_earlgrey_2.u_xbar_main.tl_cored_o                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_dm_sba_o                   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_dm_sba_o                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rom_ctrl__rom_o            == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rom_ctrl__rom_o             &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rom_ctrl__regs_o           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rom_ctrl__regs_o            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_debug_mem_o                == top_level_upec.top_earlgrey_2.u_xbar_main.tl_debug_mem_o                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_ram_main_o                 == top_level_upec.top_earlgrey_2.u_xbar_main.tl_ram_main_o                  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_eflash_o                   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_eflash_o                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_secure_o              == top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_secure_o               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_peri_untrusted_o           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_peri_untrusted_o            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_flash_ctrl__core_o         == top_level_upec.top_earlgrey_2.u_xbar_main.tl_flash_ctrl__core_o          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_flash_ctrl__prim_o         == top_level_upec.top_earlgrey_2.u_xbar_main.tl_flash_ctrl__prim_o          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_hmac_o                     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_hmac_o                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_kmac_o                     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_kmac_o                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_aes_o                      == top_level_upec.top_earlgrey_2.u_xbar_main.tl_aes_o                       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_entropy_src_o              == top_level_upec.top_earlgrey_2.u_xbar_main.tl_entropy_src_o               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_csrng_o                    == top_level_upec.top_earlgrey_2.u_xbar_main.tl_csrng_o                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_edn0_o                     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_edn0_o                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_edn1_o                     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_edn1_o                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_rv_plic_o                  == top_level_upec.top_earlgrey_2.u_xbar_main.tl_rv_plic_o                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_otbn_o                     == top_level_upec.top_earlgrey_2.u_xbar_main.tl_otbn_o                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_keymgr_o                   == top_level_upec.top_earlgrey_2.u_xbar_main.tl_keymgr_o                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_sram_ctrl_main_o           == top_level_upec.top_earlgrey_2.u_xbar_main.tl_sram_ctrl_main_o            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.tl_bus_ctrl_o                 == top_level_upec.top_earlgrey_2.u_xbar_main.tl_bus_ctrl_o
    );
endfunction

function automatic micro_soc_state_equivalence_xbar_main();
    micro_soc_state_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.storage                                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.storage                                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                                &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                     &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_rptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_wptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.storage                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_26.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_26.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_28.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_28.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_29.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_29.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_31.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_31.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_33_secure.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                 == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_33_secure.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_46.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_46.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_47.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_47.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_48.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_48.gen_arb_ppc.u_reqarb.gen_normal_case.mask
    );
endfunction

function automatic soc_state_equivalence_xbar_main();
    soc_state_equivalence_xbar_main = (
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_rptr_sync_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.fifo_wptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.storage                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.storage                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_rptr_sync_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_gray_q                                                                  == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_gray_q                                                                   &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_q                                                                       == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.fifo_wptr_q                                                                        &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.storage                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.storage                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o      == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_secure.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o       &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_gray_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_q                                                                     &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_rptr_sync_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_gray_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.fifo_wptr_q                                                                     &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.storage                                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.storage                                                                         &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.reqfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_gray_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_q                                                                     &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_rptr_sync_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                               == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_gray_q                                                                &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                    == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.fifo_wptr_q                                                                     &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.storage                                                                         &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_rptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_1.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o   == top_level_upec.top_earlgrey_2.u_xbar_main.u_asf_32_untrusted.rspfifo.sync_wptr.gen_generic.u_impl_generic.u_sync_2.gen_generic.u_impl_generic.q_o    &&      //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_25.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_25.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_30.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_30.num_req_outstanding                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.dev_select_outstanding                                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_opcode                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_req_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_size                                                                                 &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.err_resp.err_source                                                                               &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_rptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.fifo_wptr                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.storage                                                            &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.reqfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                          &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                          &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.storage                                                            &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_49.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_49.num_req_outstanding                                                                               &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_rptr                                                          &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.fifo_wptr                                                          &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.storage                                                            &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.fifo_h.rspfifo.gen_normal_fifo.under_rst                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.dev_select_outstanding                                                                           == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.dev_select_outstanding                                                                            &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_opcode                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_opcode                                                                               &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_req_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_req_pending                                                                          &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_rsp_pending                                                                         == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_rsp_pending                                                                          &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_size                                                                                == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_size                                                                                 &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.err_resp.err_source                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.err_resp.err_source                                                                               &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_s1n_50.num_req_outstanding                                                                              == top_level_upec.top_earlgrey_2.u_xbar_main.u_s1n_50.num_req_outstanding                                                                               &&    //
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_26.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_26.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_27.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_28.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_28.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_29.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_29.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_31.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_31.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_33_secure.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                 == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_33_secure.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                  &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_34.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_35.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_36.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_37.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_38.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_39.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_40.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_41.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_42.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_43.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_44.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.reqfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_rptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.fifo_wptr                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                     == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.storage                                                      &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                   == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_45.u_devicefifo.rspfifo.gen_normal_fifo.under_rst                                                    &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_46.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_46.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_47.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_47.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                         &&
        top_level_upec.top_earlgrey_1.u_xbar_main.u_sm1_48.gen_arb_ppc.u_reqarb.gen_normal_case.mask                                                        == top_level_upec.top_earlgrey_2.u_xbar_main.u_sm1_48.gen_arb_ppc.u_reqarb.gen_normal_case.mask         
    );
endfunction