#!/bin/bash

echo "Inserisci il nome del file da ordinare:"
read file_name

if [[ ! -f "$file_name" ]]; then
  echo "Errore: Il file '$file_name' non esiste. Uscita."
  exit 1
fi

sorted_file="ordinato_$file_name"
sort "$file_name" > "$sorted_file"

echo "Il file ordinato è stato salvato in '$sorted_file'."
