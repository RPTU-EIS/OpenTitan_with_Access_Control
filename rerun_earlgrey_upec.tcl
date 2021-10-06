# Author: Dino Mehmedagić

# Tcl script reads the .sva file and asserts the UPEC property. It is assumed that the Earlgrey
# design is already loaded in and that the tool is in mv mode. To set up the tool from scratch
# use the script "open_earlgrey_upec.tcl"

read_sva  {/import/home/mehmedag/opentitan/hw/upec/upec_integrity.sva}
check -verbose -approver1_steps 1 -approver2_steps 0 -approver3_steps 0 -approver4_steps 0 -disprover1_steps 0 -prover1_steps 0 -prover2_steps 0 -prover_exec_order {{approver1:0 approver1:1 approver1:2 approver1:3 approver1:4 approver1:5 approver1:6 approver1:7 approver1:8}} {sva/checker_inst/ops/upec_assert}
debug {sva/checker_inst/ops/upec_assert}
