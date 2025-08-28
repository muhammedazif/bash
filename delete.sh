#!/bin/bash
# Script to delete .mpeg and .mp3 files from a user's home directory
# Usage: ./delete_media.sh username

# Check if a username is provided
if [ -z "$1" ]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USER_NAME="$1"
USER_HOME=$(eval echo "~$USER_NAME")

# Verify the user exists
if [ ! -d "$USER_HOME" ]; then
    echo "Error: Home directory for user '$USER_NAME' not found."
    exit 1
fi

# Find and delete .mpeg and .mp3 files
echo "Deleting .mpeg and .mp3 files from $USER_NAME's home directory..."
find "$USER_HOME" -type f \( -iname "*.mpeg" -o -iname "*.mp3" \) -exec rm -f {} \;

echo "Done."

