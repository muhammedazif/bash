#!/bin/bash

while true;do
 
	read -p "Enter the number[1-3]: " number

   case $number in

  1)
	echo "Monday"
	;;
  2)
	echo "Tuesday"
	;;
  3) 
	echo "Wendesday"
	;;
  *)
	echo "use the correct number mate!"
	break
	;;
esac

done
