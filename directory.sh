#!/bin/bash 

read -p "enter the directory path" path 

if [ -d $path ]; then 
	echo "Directory exists"
else 
	mkdir -p $path
	echo "Directory created"
fi


