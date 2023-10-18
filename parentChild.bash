#!/bin/bash
#_name = "/home/bin/bash"
#=0
#pid = "/home.pid"
echo "pid is $$"
((${_name}) & jobs -p >$${_pid})
until ((i > 0)); do
    echo $i "child process starts:"
    #sleep 3 &
    sleep 1 & exec sleep 10 &
    echo "child is $!"
    echo "terminated"
    echo "parent is $!"
    echo "parent waits'$SECONDS'"
    wait
    echo "The child $! has the exit status $?"
    echo "$(date)": "parent is awake."
    ((i++))
    
    
done
ps -C bash
