#!/bin/bash

CONTACT="contact.csv"

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

adding_contact(){
	read -p "Enter the name and phone number you need to add: " name number
	if [[ -z "$name" || -z "$number" ]]; then 
		echo "Name and number can't be empty!..."
		exit 0
	fi 
	echo ""$name","$number"" >> "$CONTACT"
	echo "Contact added successfully......"
}

view_contacts(){
	    if [ -z "$CONTACT" ];then
		    echo "There are no contacts to list"
		    exit 0
	    fi

	   while IFS="," read -r names numbers; do
             echo "Hi "$names", your number is "$numbers" "
           done < "$CONTACT" 

	   echo "All contacts has been listed....."
}

search_contact() {
    read -p "Enter the name to search: " search_name

    found=0
    while IFS="," read -r cname cnumber; do
        if [[ "$search_name" == "$cname" ]]; then
            echo "Found: $cname - $cnumber"
            found=1
            break
        fi
    done < "$CONTACT_FILE"

    if [[ $found -eq 0 ]]; then
        read -p "Not found. Do you want to search by number? (y/n): " yn
        if [[ "$yn" == "y" ]]; then
            read -p "Enter the number: " search_number
            while IFS="," read -r cname cnumber; do
                if [[ "$search_number" == "$cnumber" ]]; then
                    echo "Found: $cname - $cnumber"
                    found=1
                    break
                fi
            done < "$CONTACT_FILE"
        fi
    fi

    if [[ $found -eq 0 ]]; then
        echo "Contact not found."
    fi
}




if [ ! -f "$CONTACT" ]; then
	touch $CONTACT
fi

while IFS="," read -r names numbers; do
	echo ""$names","$numbers"" >> "$CONTACT"
done





