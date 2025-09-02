while true; do
    clear
    menu
    read -p "Choose an option: " option

    if [[ "$option" -ge 1 && "$option" -le 4 ]]; then
        read -p "Enter two numbers separated by space: " num num1
        if [[ -z "$num" || -z "$num1" ]]; then
            echo "Numbers cannot be empty"
            read -p "Press ENTER to continue..."
            continue
        fi
    fi

    case $option in
        1) echo "Sum: $((num + num1))" ;;
        2) echo "Subtraction: $((num - num1))" ;;
        3) echo "Multiplication: $((num * num1))" ;;
        4)
           if [[ "$num1" -eq 0 ]]; then
               echo "Cannot divide by zero"
           else
               echo "Division: $((num / num1))"
           fi
           ;;
        5) break ;;
        *) echo "Enter a correct option" ;;
    esac

    read -p "Press ENTER to continue..."
done

