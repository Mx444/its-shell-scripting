#!/bin/bash

# Chiedere il nome della directory
echo "Inserisci il percorso della directory:"
read dir_name

# Controllare che la directory esista
if [[ ! -d "$dir_name" ]]; then
  echo "Errore: La directory '$dir_name' non esiste. Uscita."
  exit 1
fi

# Contare file e directory
file_count=$(find "$dir_name" -type f | wc -l)
dir_count=$(find "$dir_name" -type d | wc -l)

# Creare il report
report_file="report_$(basename "$dir_name").txt"
echo "Directory: $dir_name" > "$report_file"
echo "Numero di file: $file_count" >> "$report_file"
echo "Numero di directory: $dir_count" >> "$report_file"

echo "Il report è stato salvato in '$report_file'."
