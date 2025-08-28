#!/bin/bash

read -p "Enter the filename: " file

if [ ! -f "$file" ]; then
    echo "Error: File does not exist."
    exit 1
fi

echo "Top 5 most frequent words in $file:"
tr -s '[:space:]' '\n' < "$file" | \
tr '[:upper:]' '[:lower:]' | \
sort | uniq -c | sort -nr | head -5



