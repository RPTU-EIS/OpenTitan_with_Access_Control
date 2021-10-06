set signallist [get_signals_sv -golden -filter {state==true}]

start_message_log -force ./onespin_signal_list.log
foreach s $signallist {
    puts $s
}
stop_message_log