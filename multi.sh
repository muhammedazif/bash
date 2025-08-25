#!/bin/bash

count_lines() {
    echo "Total lines: $(wc -l < "$1")"
}

count_words() {
    echo "Total words: $(wc -w < "$1")"
}

count_chars() {
    echo "Total chars: $(wc -m < "$1")"
}

if [ $# -eq 0 ]; then
    echo "Usage: ./analyze.sh <file1> <file2> ..."
    exit 1
fi

for file in "$@"; do
    echo "Analyzing: $file"
    if [ -f "$file" ]; then
        count_lines "$file"
        count_words "$file"
        count_chars "$file"
        echo "-----------------------"
    else
        echo "File '$file' does not exist!"
        echo "-----------------------"
    fi
done

