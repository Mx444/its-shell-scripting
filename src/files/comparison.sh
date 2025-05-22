#!/bin/bash

echo "Inserisci il nome del primo file:"
read file1
echo "Inserisci il nome del secondo file:"
read file2

if [[ ! -f "$file1" ]] || [[ ! -f "$file2" ]]; then
  echo "Errore: Uno o entrambi i file non esistono. Uscita."
  exit 1
fi

diff "$file1" "$file2"
if [[ $? -eq 0 ]]; then
  echo "I file sono identici."
else
  echo "I file hanno delle differenze."
fi
