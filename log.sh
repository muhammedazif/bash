#!/bin/bash


BLACK=$'\033[30m'
RED=$'\033[31m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BLUE=$'\033[34m'
MAGENTA=$'\033[35m'
CYAN=$'\033[36m'
WHITE=$'\033[37m'

RESET=$'\033[0m'


read -p "${RED}Enter the path of the log file .${RESET}" log

if [ ! -f "$log" ];then
	echo "${YELLOW}File is not found .${RESET}"
	exit 0
fi 


while true; do

 echo "===================="
 echo "${RED} Choose the options below.${RESET}"
 echo "======================"
echo "1) Show total number of lines"
echo "2) Show total number of words"
echo "3) Show top 5 most common words"
echo "4) Exit"

read -p "Enter the number" number 

case $number in

  1)
	echo "${MAGENTA} $(wc -l <"$log" ) .${RESET}"
	;;
  2)
	echo "$(wc -w < $log)"
	;;
  3)
	echo $(tr -s ' ' '\n' < "$log" | sort | uniq -c | sort -nr | head -5)
	;;
  4)
	exit 0
	;;
  *)
	break
	;;
esac

done
