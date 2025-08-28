#!/bin/bash

while true; do
    echo "========================"
    echo "       MAIN MENU"
    echo "========================"
    echo "1) Show current date and time"
    echo "2) Show current directory"
    echo "3) Show logged in users"
    echo "4) Exit"
    echo "========================"

    read -p "Enter your choice [1-4]: " choice

    case $choice in
        1)
            echo "Current date and time: $(date)"
            ;;
        2)
            echo "You are in: $(pwd)"
            ;;
        3)
            echo "Logged in users:"
            who
            ;;
        4)
            echo "Exiting... Goodbye!"
            break
            ;;
        *)
            echo "Invalid choice, try again."
            ;;
    esac
    echo ""
done

