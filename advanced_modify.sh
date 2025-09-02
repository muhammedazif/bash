#!/bin/bash

# ========================
#  Advanced Phonebook
# ========================

CONTACT="contacts.csv"

# ------------------------
#  Functions
# ------------------------

menu() {
    cat << EOF
=======================
   ADVANCED PHONEBOOK
=======================
1) Add a contact
2) View all contacts
3) Search contact
4) Update contact
5) Delete contact
6) Import contacts from CSV
7) Export contacts to CSV
8) Sort contacts alphabetically
9) Exit
EOF
}

add_contact() {
    read -p "Enter name: " name
    read -p "Enter number: " number

    if [[ -z "$name" || -z "$number" ]]; then
        echo "Name and number cannot be empty!"
        return
    fi

    echo "$name,$number" >> "$CONTACT"
    echo "Contact added: $name - $number"
}

view_contacts() {
    if [[ ! -s "$CONTACT" ]]; then
        echo "There are no contacts to list."
        return
    fi

    i=1
    while IFS="," read -r name number; do
        echo "$i) $name - $number"
        ((i++))
    done < "$CONTACT"
    echo "All contacts have been listed."
}

search_contact() {
    read -p "Search by name or number: " query
    found=0
    while IFS="," read -r name number; do
        if [[ "${name,,}" == *"${query,,}"* || "${number,,}" == *"${query,,}"* ]]; then
            echo "Found: $name - $number"
            found=1
        fi
    done < "$CONTACT"

    [[ $found -eq 0 ]] && echo "No match found."
}

update_contact() {
    read -p "Enter the name of the contact to update: " search
    temp_file=$(mktemp)
    updated=0

    while IFS="," read -r name number; do
        if [[ "${name,,}" == "${search,,}" ]]; then
            read -p "New name (leave blank to keep '$name'): " new_name
            read -p "New number (leave blank to keep '$number'): " new_number
            [[ -z "$new_name" ]] && new_name="$name"
            [[ -z "$new_number" ]] && new_number="$number"
            echo "$new_name,$new_number" >> "$temp_file"
            updated=1
        else
            echo "$name,$number" >> "$temp_file"
        fi
    done < "$CONTACT"

    mv "$temp_file" "$CONTACT"
    [[ $updated -eq 1 ]] && echo "Contact updated." || echo "Contact not found."
}

delete_contact() {
    read -p "Enter the name of the contact to delete: " search
    temp_file=$(mktemp)
    deleted=0

    while IFS="," read -r name number; do
        if [[ "${name,,}" == "${search,,}" ]]; then
            read -p "Are you sure you want to delete $name (y/n)? " yn
            if [[ "$yn" == "y" ]]; then
                deleted=1
                continue
            fi
        fi
        echo "$name,$number" >> "$temp_file"
    done < "$CONTACT"

    mv "$temp_file" "$CONTACT"
    [[ $deleted -eq 1 ]] && echo "Contact deleted." || echo "Contact not found."
}

import_contacts() {
    read -p "Enter CSV file to import: " file
    if [[ ! -f $file ]]; then
        echo "File not found!"
        return
    fi
    tail -n +2 "$file" >> "$CONTACT"
    echo "Contacts imported from $file"
}

export_contacts() {
    read -p "Enter filename for export (default: backup.csv): " file
    file=${file:-backup.csv}
    echo "Name,Number" > "$file"
    cat "$CONTACT" >> "$file"
    echo "Contacts exported to $file"
}

sort_contacts() {
    if [[ ! -s "$CONTACT" ]]; then
        echo "No contacts to sort."
        return
    fi
    sort -t, -k1,1 "$CONTACT" -o "$CONTACT"
    echo "Contacts sorted alphabetically by name."
}

# ------------------------
#  Main Loop
# ------------------------

while true; do
    clear
    menu
    echo
    read -p "Choose an option: " option
    case $option in
        1) add_contact ;;
        2) view_contacts ;;
        3) search_contact ;;
        4) update_contact ;;
        5) delete_contact ;;
        6) import_contacts ;;
        7) export_contacts ;;
        8) sort_contacts ;;
        9) echo "Exiting..."; break ;;
        *) echo "Invalid option!" ;;
    esac
    echo
    read -p "Press ENTER to continue..."
done

