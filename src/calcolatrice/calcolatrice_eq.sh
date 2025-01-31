#!/bin/bash

# Funzione per il menu principale
function menu_principale() {
  echo "Benvenuto nella calcolatrice avanzata!"
  echo "Scegli un'opzione:"
  echo "1. Operazioni base (somma, sottrazione, moltiplicazione, divisione)"
  echo "2. Risolvere equazioni di primo grado (ax + b = 0)"
  echo "3. Esci"
  read -p "Inserisci la tua scelta (1-3): " scelta
}

# Funzione per operazioni base
function operazioni_base() {
  echo "Hai scelto: Operazioni base"
  echo "Inserisci il primo numero:"
  read numero1
  echo "Inserisci il secondo numero:"
  read numero2
  echo "Scegli l'operazione (+, -, *, /):"
  read operazione

  # Calcolo
  case $operazione in
    +) risultato=$(echo "$numero1 + $numero2" | bc) ;;
    -) risultato=$(echo "$numero1 - $numero2" | bc) ;;
    \*) risultato=$(echo "$numero1 * $numero2" | bc) ;;
    /) 
      if [[ $numero2 == 0 ]]; then
        echo "Errore: Divisione per zero non consentita."
        return
      fi
      risultato=$(echo "scale=2; $numero1 / $numero2" | bc) ;;
    *) echo "Operazione non valida!"; return ;;
  esac

  echo "Risultato: $risultato"
}

# Funzione per risolvere equazioni di primo grado
function equazione_primo_grado() {
  echo "Hai scelto: Risolvere equazioni di primo grado (forma: ax + b = 0)"
  echo "Inserisci il coefficiente 'a' (diverso da 0):"
  read a
  echo "Inserisci il coefficiente 'b':"
  read b

  if [[ $a == 0 ]]; then
    echo "Errore: Il coefficiente 'a' non può essere 0 in un'equazione di primo grado."
    return
  fi

  # Risoluzione dell'equazione
  risultato=$(echo "scale=2; -$b / $a" | bc)
  echo "La soluzione dell'equazione $a*x + $b = 0 è: x = $risultato"
}

# Ciclo principale
while true; do
  menu_principale
  case $scelta in
    1) operazioni_base ;;
    2) equazione_primo_grado ;;
    3) echo "Uscita..."; break ;;
    *) echo "Scelta non valida. Riprova." ;;
  esac
  echo ""
done
