Bash Process Performance Monitoring Script

Project Overview
This Bash script is designed to monitor and analyze the performance of processes on a system, specifically tracking CPU and memory usage of child processes. The script spawns child processes and logs relevant performance metrics such as CPU usage, memory consumption, and runtime. This data can then be used for performance analysis and monitoring over time.

The project is ideal for automating the process of collecting performance data and can be extended with additional functionality, such as automated email alerts, data visualization, and integration with log management tools.

Features
Process Monitoring: Tracks CPU and memory usage of spawned child processes.
Automated Logging: Logs performance data (CPU%, memory%, runtime) to a CSV file for later analysis.
Process Handling: Starts child processes, waits for them to finish, and logs their status.
Scalable Automation: Can be automated using cron jobs for continuous data collection over time.
Customizable: Users can modify the script to monitor different types of processes or add custom logging formats and features (e.g., alerts, data transfer).
How it Works
The script starts by forking a child process (currently set to a simple sleep command), and assigns it a process ID (pid).
It then logs the process ID and monitors the child process while it runs, capturing CPU and memory usage using the ps command.
Performance data (including CPU%, memory%, and runtime) is written to a CSV file with timestamps for further analysis.
The script loops through this process, monitoring multiple child processes over time.
Usage
Prerequisites
Ensure that your system has:

Bash (version 4.0 or higher)
Basic ps command functionality for gathering process stats
