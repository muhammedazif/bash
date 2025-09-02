#!/bin/bash 

echo "Script to clean up the files!"

read -p "Enter the directory path for the checking... " directory

if [ ! -d "$directory" ]; then 
	echo "The directory doesn't exsit and nothing to delete..."
	exit 1
fi

COUNT=0
for file in "$directory"/*; do 
	if [[ -f "$file" && "$file" != *.sh ]]; then 
		((COUNT++))
		rm -rf "$file" 
	fi
done

echo "The total number of files are "$COUNT" "
