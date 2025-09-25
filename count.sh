#!/bin/bash

read -p "Enter the directory path you need to check ?  " directory

if [ ! -d "$directory" ]; then 
	echo "Please enter a valid path!"
	exit 0
fi

DIR=0
FILE=0
for file in "$directory"/*; do 
	if [ -d "$file" ]; then 
		((DIR++))
	elif [ -f "$file" ]; then
		((FILE++))
	fi
done 

echo "Directory: "$directory""
echo "Files: "$FILE" "
echo "Subdirectories: "$DIR""


