# Author: Dino Mehmedagić

# Tcl script loads all OpenTitan Earl Grey HDL files with the top_level_upec as the top level file,
# containing two instances of the Earl Grey chip for verifivcation with UPEC. The script uses the
# files in opentitan/build/lowrisc_systems_chip_earlgrey_verilator_0.1/src, which contains all the
# necessary HDL to run the design in OneSpin

# @lang=tcl @ts=8# @lang=tcl @ts=8# findFiles
# basedir - the directory to start looking in
# pattern - A pattern, as defined by the glob command, that the files must match
proc findFiles { basedir pattern } {

    # Fix the directory name, this ensures the directory name is in the
    # native format for the platform and contains a final directory seperator
    set basedir [string trimright [file join [file normalize $basedir] { }]]
    set fileList {}

    # Look in the current directory for matching files, -type {f r}
    # means ony readable normal files are looked at, -nocomplain stops
    # an error being thrown if the returned list is empty
    foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
        lappend fileList $fileName
    }

    # Now look for any sub direcories in the current directory
    foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
        # Recusively call the routine on the sub directory and append any
        # new files to the results
        set subDirList [findFiles $dirName $pattern]
        if { [llength $subDirList] > 0 } {
            foreach subDirFile $subDirList {
                lappend fileList $subDirFile
            }
        }
    }
    return $fileList
 }

restart -force

cd "~/opentitan"

set_read_hdl_option -golden -verilog_version sv2012
set pkgbuildfiles [findFiles ./build-onespin/lowrisc_systems_chip_earlgrey_verilator_0.1/src  "*_pkg.sv"]
set hdlbuildfiles [findFiles ./build-onespin/lowrisc_systems_chip_earlgrey_verilator_0.1/src  "*.sv"]

foreach f $pkgbuildfiles {
	puts "$f"
	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
}
foreach f $hdlbuildfiles {
	puts "$f"
	read_verilog -golden  -pragma_ignore {} -version sv2012 $f
}
read_verilog -golden  -pragma_ignore {} -version sv2012 ./hw/top_earlgrey/rtl/top_level_upec.sv

set_elaborate_option -top verilog!work.top_level_upec
set_elaborate_option -loop_iter_threshold 1000
elaborate -golden

set_compile_option -golden -black_box_instances { {top_earlgrey_1/u_dm_top} {top_earlgrey_1/u_dft_tap_breakout}
                                                {top_earlgrey_1/u_tl_adapter_ram_main} {top_earlgrey_1/u_ram1p_ram_main} {top_earlgrey_1/u_tl_adapter_ram_ret_aon} 
                                                {top_earlgrey_1/u_ram1p_ram_ret_aon} {top_earlgrey_1/u_tl_adapter_eflash} {top_earlgrey_1/u_flash_eflash} {top_earlgrey_1/u_uart0}
                                                {top_earlgrey_1/u_uart1} {top_earlgrey_1/u_uart2} {top_earlgrey_1/u_uart3} {top_earlgrey_1/u_gpio} {top_earlgrey_1/u_spi_device}
                                                {top_earlgrey_1/u_spi_host0} {top_earlgrey_1/u_spi_host1} {top_earlgrey_1/u_i2c0} {top_earlgrey_1/u_i2c1} {top_earlgrey_1/u_i2c2}
                                                {top_earlgrey_1/u_pattgen} {top_earlgrey_1/u_rv_timer} {top_earlgrey_1/u_usbdev} {top_earlgrey_1/u_otp_ctrl} {top_earlgrey_1/u_lc_ctrl}
                                                {top_earlgrey_1/u_alert_handler} {top_earlgrey_1/u_pwrmgr_aon} {top_earlgrey_1/u_rstmgr_aon} {top_earlgrey_1/u_clkmgr_aon}
                                                {top_earlgrey_1/u_sysrst_ctrl_aon} {top_earlgrey_1/u_adc_ctrl_aon} {top_earlgrey_1/u_pwm_aon} {top_earlgrey_1/u_pinmux_aon}
                                                {top_earlgrey_1/u_aon_timer_aon} {top_earlgrey_1/u_sensor_ctrl_aon} {top_earlgrey_1/u_sram_ctrl_ret_aon} {top_earlgrey_1/u_flash_ctrl}
                                                {top_earlgrey_1/u_rv_plic} {top_earlgrey_1/u_aes} {top_earlgrey_1/u_hmac} {top_earlgrey_1/u_kmac} {top_earlgrey_1/u_keymgr}
                                                {top_earlgrey_1/u_csrng} {top_earlgrey_1/u_entropy_src} {top_earlgrey_1/u_edn0} {top_earlgrey_1/u_edn1}
                                                {top_earlgrey_1/u_sram_ctrl_main} {top_earlgrey_1/u_otbn} {top_earlgrey_1/u_rom_ctrl} {top_earlgrey_1/u_bus_ctrl}
                                                {top_earlgrey_1/u_xbar_peri} 
                                                {top_earlgrey_2/u_dm_top} {top_earlgrey_2/u_dft_tap_breakout}
                                                {top_earlgrey_2/u_tl_adapter_ram_main} {top_earlgrey_2/u_ram1p_ram_main} {top_earlgrey_2/u_tl_adapter_ram_ret_aon} 
                                                {top_earlgrey_2/u_ram1p_ram_ret_aon} {top_earlgrey_2/u_tl_adapter_eflash} {top_earlgrey_2/u_flash_eflash} {top_earlgrey_2/u_uart0}
                                                {top_earlgrey_2/u_uart1} {top_earlgrey_2/u_uart2} {top_earlgrey_2/u_uart3} {top_earlgrey_2/u_gpio} {top_earlgrey_2/u_spi_device}
                                                {top_earlgrey_2/u_spi_host0} {top_earlgrey_2/u_spi_host1} {top_earlgrey_2/u_i2c0} {top_earlgrey_2/u_i2c1} {top_earlgrey_2/u_i2c2}
                                                {top_earlgrey_2/u_pattgen} {top_earlgrey_2/u_rv_timer} {top_earlgrey_2/u_usbdev} {top_earlgrey_2/u_otp_ctrl} {top_earlgrey_2/u_lc_ctrl}
                                                {top_earlgrey_2/u_alert_handler} {top_earlgrey_2/u_pwrmgr_aon} {top_earlgrey_2/u_rstmgr_aon} {top_earlgrey_2/u_clkmgr_aon}
                                                {top_earlgrey_2/u_sysrst_ctrl_aon} {top_earlgrey_2/u_adc_ctrl_aon} {top_earlgrey_2/u_pwm_aon} {top_earlgrey_2/u_pinmux_aon}
                                                {top_earlgrey_2/u_aon_timer_aon} {top_earlgrey_2/u_sensor_ctrl_aon} {top_earlgrey_2/u_sram_ctrl_ret_aon} {top_earlgrey_2/u_flash_ctrl}
                                                {top_earlgrey_2/u_rv_plic} {top_earlgrey_2/u_aes} {top_earlgrey_2/u_hmac} {top_earlgrey_2/u_kmac} {top_earlgrey_2/u_keymgr}
                                                {top_earlgrey_2/u_csrng} {top_earlgrey_2/u_entropy_src} {top_earlgrey_2/u_edn0} {top_earlgrey_2/u_edn1}
                                                {top_earlgrey_2/u_sram_ctrl_main} {top_earlgrey_2/u_otbn} {top_earlgrey_2/u_rom_ctrl} {top_earlgrey_2/u_bus_ctrl}
                                                {top_earlgrey_2/u_xbar_peri} }

set_compile_option -golden -black_box { {untrusted_device__INSTANCE_PATHtop_level_upec_top_earlgrey_1_u_untrusted_device} 
                                                {untrusted_device__INSTANCE_PATHtop_level_upec_top_earlgrey_2_u_untrusted_device} }
#                                                {rv_core_ibex__INSTANCE_PATHtop_level_upec_top_earlgrey_1_u_rv_core_ibex}
#                                                {rv_core_ibex__INSTANCE_PATHtop_level_upec_top_earlgrey_2_u_rv_core_ibex} }
compile -golden

set_clock_spec -period 2 [get_bits -unit -filter clock!=none&&direction==input]
set_mode mv
read_sva  {/import/home/mehmedag/opentitan/hw/upec/upec_integrity.sva}
check -verbose -approver1_steps 1 -approver2_steps 0 -approver3_steps 0 -approver4_steps 0 -disprover1_steps 0 -prover1_steps 0 -prover2_steps 0 -prover_exec_order {{approver1:0 approver1:1 approver1:2 approver1:3 approver1:4 approver1:5 approver1:6 approver1:7 approver1:8}} {sva/checker_inst/ops/upec_assert}
debug {sva/checker_inst/ops/upec_assert}
