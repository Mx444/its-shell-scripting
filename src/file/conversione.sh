#!/bin/bash

# Chiedere il nome del file
echo "Inserisci il nome del file da convertire:"
read file_name

# Controllare che il file esista
if [[ ! -f "$file_name" ]]; then
  echo "Errore: Il file '$file_name' non esiste. Uscita."
  exit 1
fi

# Convertire il contenuto in maiuscolo e salvarlo
converted_file="maiuscolo_$file_name"
tr '[:lower:]' '[:upper:]' < "$file_name" > "$converted_file"

echo "Il file convertito è stato salvato in '$converted_file'."
