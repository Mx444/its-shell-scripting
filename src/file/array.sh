#!/bin/bash

# Define an array
libri=("The Great Gatsby" "1984" "To Kill a Mockingbird" "Pride and Prejudice")

# Print all elements of the array
echo "List of books:"
for libro in "${libri[@]}"; do
    echo "$libro"
done

# Add a new book to the array
libri+=("Moby Dick")

# Remove a book (by index, let's remove the first book)
unset libri[0]

# Print the updated list
echo -e "\nUpdated list of books:"
for libro in "${libri[@]}"; do
    echo "$libro"
done
