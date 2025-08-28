#!/bin/bash

show_menu() {
    echo "===================="
    echo "${RED} Choose an option below ${RESET}"
    echo "===================="
    echo "1) Show total number of lines"
    echo "2) Show total number of words"
    echo "3) Show top 5 most common words"
    echo "4) Exit"
}


count_lines() {
    echo "${MAGENTA}Total lines: $(wc -l < "$log")${RESET}"
}

count_words() {
    echo "${MAGENTA}Total words: $(wc -w < "$log")${RESET}"
}

top_words() {
    echo "${MAGENTA}Top 5 most common words:${RESET}"
    tr -s ' ' '\n' < "$log" | sort | uniq -c | sort -nr | head -5
}

read -p "Enter the log file you wants to check: " log

if [ ! -f "$log" ];then
	echo "File is not found "
	exit 0
fi

while true; do
    show_menu
    read -p "Enter your choice: " number

    case $number in
        1) count_lines ;;
        2) count_words ;;
        3) top_words ;;
        4) echo "${GREEN}Goodbye!${RESET}"; exit 0 ;;
        *) echo "${YELLOW}Invalid choice. Try again.${RESET}" ;;
    esac
done

