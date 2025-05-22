#!/bin/bash

echo "Inserisci il nome del file in cui cercare:"
read file_name

if [[ ! -f "$file_name" ]]; then
  echo "Errore: Il file '$file_name' non esiste. Uscita."
  exit 1
fi

echo "Inserisci la parola chiave da cercare:"
read keyword

if [[ -z "$keyword" ]]; then
  echo "Errore: Non hai inserito una parola chiave valida. Uscita."
  exit 1
fi

occurrences=$(grep -o "\b$keyword\b" "$file_name" | wc -l)

if [[ $occurrences -gt 0 ]]; then
  echo "La parola chiave '$keyword' è stata trovata $occurrences volte nel file '$file_name'."
else
  echo "La parola chiave '$keyword' non è stata trovata nel file '$file_name'."
fi
