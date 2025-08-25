#!/bin/bash

count_lines() {
    echo "Total lines: $(wc -l < "$1")"
}

count_words() {
    echo "Total words: $(wc -w < "$1")"
}

# First check if any argument was provided
if [ $# -eq 0 ]; then
    echo "Usage: ./script.sh <filename>"
    exit 1
fi

# Then check if the file exists
if [ -f "$1" ]; then
    count_lines "$1"
    count_words "$1"
else
    echo "File '$1' does not exist!"
    exit 1
fi

