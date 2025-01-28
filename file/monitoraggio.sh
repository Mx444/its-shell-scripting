#!/bin/bash

# Chiedere il nome del file
echo "Inserisci il nome del file da monitorare:"
read file_name

while true; do
  if [[ -f "$file_name" ]]; then
    echo "Il file '$file_name' esiste."
  else
    echo "Il file '$file_name' non esiste."
  fi
  sleep 10
done
