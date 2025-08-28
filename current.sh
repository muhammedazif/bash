#!/bin/bash

menu(){

	echo "==================="
	echo "  DISK REPORT MENU "
	echo "==================="
	echo "1) Top 10 largest files"
	echo "2) Top 10 largest directories"
	echo "3) Exit "
}

largest_files(){
	echo "The largest files are listed below: "
	du -ah . | sort -rh | head -10
}

largest_directories(){
	echo "The largest directories are listed below: "
	du -sh ./* | sort -rh | head -10
}


while true; do
	clear
	menu
	read -p "Enter the option:  " option
	
case $option in

1) largest_files;;
2) largest_directories;;
3) break ;;
*) echo "Enter the currect options" ;;

esac

    echo
    read -p "Press Enter to continue..." 


done

