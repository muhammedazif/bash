#!/bin/bash

read -p "Enter the number: " number

factorial() {
    local n=$1
    if (( n < 0 )); then
        echo "Error: Factorial of negative numbers is undefined."
        return 1
    fi

    local total=1
    for i in $(seq 1 "$n"); do
        (( total *= i ))
    done

    echo "The factorial of $n is $total"
}

factorial "$number"

