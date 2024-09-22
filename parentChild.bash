#!/bin/bash

# Specify the CSV file location
_logfile="./process_log.csv"
recipient="bash@gmail.com"  # Email address of your team or user

# Create the log file and add a header row if it doesn't exist
if [ ! -f "$_logfile" ]; then
    echo "Timestamp, Process ID, CPU%, MEM%, Runtime (s)" > "$_logfile"
fi

# Start a loop to spawn child processes and collect data
while true; do
    # Start a new child process (replace 'sleep' with your actual process if needed)
    sleep 10 &  # Example child process that sleeps for 10 seconds
    child_pid=$!
    echo "Child process $child_pid started."

    # Capture start time
    start_time=$SECONDS

    # Monitor the child process while it runs
    while kill -0 $child_pid 2> /dev/null; do
        # Capture process stats using ps command
        cpu_mem=$(ps -p $child_pid -o %cpu,%mem --no-headers)
        timestamp=$(date '+%Y-%m-%d %H:%M:%S')
        runtime=$(($SECONDS - $start_time))

        # Log the metrics to the CSV file in CSV format
        echo "$timestamp, $child_pid, $cpu_mem, $runtime" >> "$_logfile"

        # Sleep for 1 second before collecting stats again
        sleep 1
    done

    # Wait for the child process to terminate
    wait $child_pid
    exit_status=$?
    echo "Child process $child_pid terminated with exit status $exit_status."

    # Optional: Limit the number of iterations
    i=$((i+1))
    if ((i > 5)); then
        break
    fi
done

# Send email after the process completes
subject="Process Log Report"
body="The process has completed. Please find the attached performance log."
mail -s "$subject" -a "$_logfile" "$recipient" <<< "$body"
