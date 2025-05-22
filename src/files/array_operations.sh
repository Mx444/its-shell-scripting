#!/bin/bash

libri=("The Great Gatsby" "1984" "To Kill a Mockingbird" "Pride and Prejudice")

echo "List of books:"
for libro in "${libri[@]}"; do
    echo "$libro"
done

libri+=("Moby Dick")

unset libri[0]

echo -e "\nUpdated list of books:"
for libro in "${libri[@]}"; do
    echo "$libro"
done
