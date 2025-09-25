#!/bin/bash

# Check if log file is passed as argument
if [ -n "$1" ]; then
    LOGFILE="$1"
else
    read -p "Enter the log file path: " LOGFILE
fi

LOGFILE=${LOGFILE,,}

# Validate file
if [ ! -f "$LOGFILE" ]; then
    echo "Error: File not found!"
    exit 1
fi

menu() {
    cat << EOF
========================
   LOG ANALYZER MENU
========================
1) Show total lines
2) Show top 5 most common words
3) Search for a keyword
4) Show last 10 lines
5) Exit
EOF
}

while true; do
    clear
    menu
    read -p "Enter option: " opt
 
    case $opt in
        1) echo "Total lines: $(wc -l < "$LOGFILE")" ;;
        2) awk '{for(i=1;i<=NF;i++) print $i}' "$LOGFILE" | \
           sort | uniq -c | sort -nr | head -n 5 ;;
        3) read -p "Enter keyword: " key
	   key=${key,,}
           grep -i --color=always "$key" "$LOGFILE" ;;
        4) tail -n 10 "$LOGFILE" ;;
        5) echo "Exiting..."; break ;;
        *) echo "Invalid option!" ;;
    esac

    echo
    read -p "Press ENTER to continue..."
done


