#!/bin/bash

echo "Inserisci il percorso della directory:"
read dir_name

if [[ ! -d "$dir_name" ]]; then
  echo "Errore: La directory '$dir_name' non esiste. Uscita."
  exit 1
fi

file_count=$(find "$dir_name" -type f | wc -l)
dir_count=$(find "$dir_name" -type d | wc -l)

report_file="report_$(basename "$dir_name").txt"
echo "Directory: $dir_name" > "$report_file"
echo "Numero di file: $file_count" >> "$report_file"
echo "Numero di directory: $dir_count" >> "$report_file"

echo "Il report è stato salvato in '$report_file'."
