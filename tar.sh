#!/usr/bin/bash

# This is the script to backup all the data of the home direcory of the user 

if [ -z $1 ]; then
	echo "ERROR: $0 <username>"
	exit 1
fi

USER_NAME=$1
HOME_DIRECTORIES=$(eval echo "~$USER_NAME")

if [ ! -d "$HOME_DIRECTORIES" ]; then
	echo "The user directory is not  exist!"
   else
	   echo "It doesn't not exist"
fi 

SCRIPT_DIR="$HOME_DIR/script"

if [ ! -d "$SCRIPT_DIR" ]; then
    echo "ERROR: expected script directory missing: $SCRIPT_DIR" >&2
    exit 1
fi

cd "$SCRIPT_DIR" || exit 1
