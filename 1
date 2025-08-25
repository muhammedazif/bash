#!/bin/bash

# ========================
#  Phonebook Application
# ========================

# File to store contacts
CONTACT_FILE="contacts.txt"

# Load contacts into arrays if file exists
names=()
numbers=()
if [[ -f $CONTACT_FILE ]]; then
    while IFS=":" read -r name number; do
        names+=("$name")
        numbers+=("$number")
    done < "$CONTACT_FILE"
fi

# ------------------------
#   Functions
# ------------------------

menu() {
    echo "=================="
    echo "   PHONEBOOK MENU "
    echo "=================="
    echo "1) Add a contact"
    echo "2) View all contacts"
    echo "3) Search for a contact"
    echo "4) Exit"
}

add_contact() {
    read -p "Enter name: " new_name
    read -p "Enter phone number: " new_number

    # Validate input
    if [[ -z "$new_name" || -z "$new_number" ]]; then
        echo "Name or number cannot be empty!"
        return
    fi

    # Append to arrays
    names+=("$new_name")
    numbers+=("$new_number")

    # Save to file
    echo "$new_name:$new_number" >> "$CONTACT_FILE"
    echo "Contact added successfully."
}

display_contact() {
    if [[ ${#names[@]} -eq 0 ]]; then
        echo "No contacts found."
        return
    fi

    echo "----- Contact List -----"
    for i in "${!names[@]}"; do
        echo "$((i+1)). ${names[$i]} - ${numbers[$i]}"
    done
}

search_contact() {
    read -p "Enter the contact name to search: " search_name
    found=0

    for i in "${!names[@]}"; do
        if [[ "${names[$i],,}" == "${search_name,,}" ]]; then
            echo "Contact found: ${names[$i]} - ${numbers[$i]}"
            found=1
            break
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo "Contact not found."
    fi
}

# ------------------------
#   Main Loop
# ------------------------

while true; do
    clear
    menu
    echo
    read -p "Enter the option: " option

    case $option in
        1) add_contact ;;
        2) display_contact ;;
        3) search_contact ;;
        4) echo "Exiting Phonebook..."; break ;;
        *) echo "Invalid option. Try again." ;;
    esac

    echo
    read -p "Press ENTER to continue..."
done

