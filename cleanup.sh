#!/bin/bash

echo "Cleaning up everything in the current directory (except .sh files)..."

for item in *; do
    # Skip if nothing matches
    [ -e "$item" ] || continue

    if [[ -f "$item" && "$item" != *.sh ]]; then
        echo "Deleting file: $item"
        rm -f "$item"
    elif [[ -d "$item" ]]; then
        echo "Deleting directory: $item"
        rm -rf "$item"
    fi
done

echo "Cleanup complete."

