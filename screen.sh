#!/bin/bash 
Name=$( xprop -id $(xdotool getactivewindow) | grep WM_CLASS | awk '{print $4}' | sed 's/[^a-zA-Z0-9]//g' )
import -window root ${HOME}/Download/"$Name-$(date +%Y-%m-%d-%H-%M-%S)".png && notify-send "Écran capturé !"
