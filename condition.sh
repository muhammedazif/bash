#!/bin/bash

read -p "enter the number" number

for i in $(seq 1 "$number");
do 
	if (( i % 2 == 0 ));then
		echo "$i is even"
	else
		echo "$i is odd"
	fi
done
