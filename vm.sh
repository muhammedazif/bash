#!/bin/bash

option="${1,,}"
if [ -z "$option" ]; then 
	read -p "enter the option you need to procced with (start/stop):   " option
fi

# List of VM names to shut down
VMS=("Ubuntu" "Ubuntu Clone_1")


stop(){
	for VM in "${VMS[@]}"; do
    		echo "Shutting down $VM..."
    		VBoxManage controlvm "$VM" acpipowerbutton
	done
}

start(){
	for VM in "${VMS[@]}"; do
              echo "Staring $VM..."
              VBoxManage startvm "$VM" --type gui
        done
}

if [ "$option" = "start" ]; then
	start
elif [ "$option" = "stop" ]; then
	stop
else
	exit 1
fi
