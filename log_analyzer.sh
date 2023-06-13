#!/bin/bash

# Specify the log file to analyze
LOG_FILE="/path/to/log/file.log"

# Specify the pattern to search for in the log file
PATTERN="GET"

# Search for the specified pattern in the log file
search_result=$(grep "$PATTERN" "$LOG_FILE")

# Check if the search result is not empty
if [ -n "$search_result" ]; then
    echo "Log analysis detected the following pattern: $PATTERN"

    # Generate statistics
    total_occurrences=$(grep -c "$PATTERN" "$LOG_FILE")
    echo "Total occurrences of $PATTERN: $total_occurrences"
    
else
    echo "No occurrence of the specified pattern: $PATTERN"
fi
