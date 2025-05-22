#!/bin/bash

echo "Inserisci il nome del file da convertire:"
read file_name

if [[ ! -f "$file_name" ]]; then
  echo "Errore: Il file '$file_name' non esiste. Uscita."
  exit 1
fi

converted_file="maiuscolo_$file_name"
tr '[:lower:]' '[:upper:]' < "$file_name" > "$converted_file"

echo "Il file convertito è stato salvato in '$converted_file'."
