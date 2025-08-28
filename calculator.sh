#!/bin/bash

while true;do

echo "==================="
echo "  MENU   "
echo "==================="
echo "1) Addition"
echo "2) Subtraction"
echo "==================="


read -p "Enter the option  " option 

read -p "Enter the numbers  " number1 number2

case $option in 

1)
	echo "The total is $((number1+number2))"
	;;

2)

	echo "The balance is $((number1-number2))"
	;;
3)

	echo "Sorry wrong number"
	break
	;;
esac
done

