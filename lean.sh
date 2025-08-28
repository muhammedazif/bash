#!/bin/bash

RED=$'\033[31m'
GREEN=$'\033[32m'
YELLOW=$'\033[33m'
BLUE=$'\033[34m'
RESET=$'\033[0m'


echo  "${GREEN}Let's filter the users on the the server!${RESET}"

for i in $(awk -F: '{print $1}' /etc/passwd)
do
	echo "$i" >> file.txt
done

while IFS= read -r file
	do echo "${YELLOW}$file ${RESET}"

done <file.txt

 
