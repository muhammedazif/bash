#!/bin/bash

CONTACT=contacts.txt

# Ensure contacts file exists
if [ ! -f "$CONTACT" ]; then
    touch "$CONTACT"
fi

menu(){
    echo "==============================="
    echo "        PHONEBOOK MENU"
    echo "==============================="
    echo "1) Add a contact"
    echo "2) View all contacts"
    echo "3) Search for a contact"
    echo "4) Delete a contact"
    echo "5) Exit"
}

add_contact(){
    read -p "Enter the contact name: " name
    read -p "Enter the contact number: " number

    if [[ -z "$name" || -z "$number" ]]; then
        echo "Details cannot be empty.."
        add_contact
        return
    fi 

    name="${name,,}"   # convert to lowercase
    echo "$name:$number" >>"$CONTACT"
    echo "Contact saved successfully."
}

view_contact(){
    if [ ! -s "$CONTACT" ]; then
        echo "No contacts saved yet."
        return
    fi
    echo "==== All Contacts ===="
    while IFS=":" read -r name number; do
        echo "Name: $name | Number: $number"
    done < "$CONTACT"
}

search_contact(){
    read -p "Enter the name you want to search: " search_name
    search_name="${search_name,,}"
    result=$(grep -i "^$search_name:" "$CONTACT")

    if [[ -n "$result" ]]; then
        echo "Contact found: $result"
    else
        echo "Contact not found."
    fi
}

delete_contact(){
    read -p "Enter the name you want to delete: " delete_name
    delete_name="${delete_name,,}"

    if grep -qi "^$delete_name:" "$CONTACT"; then
        grep -iv "^$delete_name:" "$CONTACT" > temp && mv temp "$CONTACT"
        echo "Contact deleted successfully."
    else
        echo "No contact found with name '$delete_name'."
    fi
}

#=========================
#     Main Function 
#=========================

while true; do 
    clear
    menu
    read -p "Enter the option: " option

    case "$option" in
        1) add_contact ;;
        2) view_contact ;;
        3) search_contact ;;
        4) delete_contact ;;
        5) echo "Goodbye!"; break ;;
        *) echo "Enter a valid option (1-5)." ;;
    esac

    echo
    read -p "Press ENTER to continue..."
done

