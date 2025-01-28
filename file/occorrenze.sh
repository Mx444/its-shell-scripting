#!/bin/bash

# Chiedere il nome del file
echo "Inserisci il nome del file in cui cercare:"
read file_name

# Controllare che il file esista
if [[ ! -f "$file_name" ]]; then
  echo "Errore: Il file '$file_name' non esiste. Uscita."
  exit 1
fi

# Chiedere la parola chiave da cercare
echo "Inserisci la parola chiave da cercare:"
read keyword

# Controllare che la parola chiave non sia vuota
if [[ -z "$keyword" ]]; then
  echo "Errore: Non hai inserito una parola chiave valida. Uscita."
  exit 1
fi

# Cercare la parola chiave nel file e contare le occorrenze
occurrences=$(grep -o "\b$keyword\b" "$file_name" | wc -l)

# Stampare il risultato
if [[ $occurrences -gt 0 ]]; then
  echo "La parola chiave '$keyword' è stata trovata $occurrences volte nel file '$file_name'."
else
  echo "La parola chiave '$keyword' non è stata trovata nel file '$file_name'."
fi
