#!/bin/bash 

read -p "Enter the file name?" filename

if [ ! -f "$filename" ]; then
	touch "$filename"
fi

for i in {1..5};
do 
	read -p "enter the line $i" line
	echo "$line" >>"$filename"
done

echo "This is the file contents"
cat $filename 
	
