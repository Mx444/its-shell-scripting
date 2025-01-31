#!/bin/bash

# Chiedere il nome della directory
echo "Inserisci il percorso della directory da eseguire il backup:"
read dir_name

# Controllare che la directory esista
if [[ ! -d "$dir_name" ]]; then
  echo "Errore: La directory '$dir_name' non esiste. Uscita."
  exit 1
fi

# Creare la directory di backup
backup_dir="${dir_name}_backup_$(date +%Y%m%d%H%M%S)"
mkdir "$backup_dir"

# Copiare i file
cp -r "$dir_name"/* "$backup_dir"

echo "Backup completato. I file sono stati copiati in '$backup_dir'."
