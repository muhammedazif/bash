#!/usr/bin/bash

echo "It is going to start and if there anything it will be the time"


SERVICE=nginx
read -p 'enter your name boy ' name

if [ systemctl is-active $SERVICE ]; then
       echo "The service is active"
else 
       echo "NO it is not active"
fi       

if [ $? -eq 0 ]; then
	echo "The command was sucessfull"
else 
	echo "something is right"
fi 
