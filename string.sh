#!/bin/bash

read -p "Enter the name of the file" file_name

if [ -f "$file_name" ];then
	echo "The number of lines $("$file_name"|wc -l)"
	echo "Number of words $("$file_name"|wc -w)"
        echo "The number of lines $("$file_name"|wc -m)"
else 
	echo "The file doesn't exist"

fi
