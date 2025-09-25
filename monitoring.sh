#!/bin/bash

menu(){
cat << EOF
=======================
   SYSTEM MONITORING
=======================
1) Show CPU Usage
2) Show Memory Usage
3) Show Disk Usage
4) Show Top 5 Processes
5) Exit
EOF
}

cpu_usage(){
    echo -n "CPU Usage: "
    # Extract idle %, subtract from 100 to get usage
    top -bn1 | awk -F'id,' -v OFS="" '/Cpu\(s\)/ {
        split($1, a, ","); 
        print 100 - a[length(a)]"%"
    }'
}

memory_usage(){
    echo -n "Memory Usage: "
    free | awk '/Mem:/ {
        printf("%.2f%% (%s / %s)\n", $3/$2*100, $3, $2)
    }'
}

disk_usage(){
    echo "Disk Usage (root partition):"
    df -h / | awk 'NR==2 {print $5 " used (" $3 " of " $2 ")"}'
}

top_process(){
    echo "Top 5 Processes by CPU:"
    ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
}

while

