# This script extracts all state signals from a given design.
# It can be used after the "elaborate" stage to obtain all state
# signals in the design or after the "compile" stage to obtain
# non-blackboxed state signals.

set signallist [get_signals_sv -golden -filter {state==true}]

start_message_log -force ./onespin_signal_list.log
foreach s $signallist {
    puts $s
}
stop_message_log