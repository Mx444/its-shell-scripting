# Inserisci percorso del file
# il file esiste ? No - uscita programma . Si ? inserisci i permessi utente owner
#Permesso valido ? No - uscita programma . Si ? inserisci i permessi gruppo
#Permesso valido ? No - uscita programma . Si ? inserisci i permessi altri
#Permesso valido ? No - uscita programma . Si ? combina i permessi e visualizza il risultato
#applicare i permessi al file
#i permessi sono stati applicati correttamente
#fine programma

echo "Inserisci percorso del file"
read file

if [ -f $file ]; then
    echo "Il file esiste"
    echo "Inserisci i permessi utente owner"
    read permessi1
    if [ $permessi1 -lt 0 ] || [ $permessi1 -gt 7 ]; then
        echo "Permesso non valido"
        exit
    fi
    echo "Inserisci i permessi gruppo"
    read permessi2
    if [ $permessi2 -lt 0 ] || [ $permessi2 -gt 7 ]; then
        echo "Permesso non valido"
        exit
    fi
    echo "Inserisci i permessi altri"
    read permessi3
    if [ $permessi3 -lt 0 ] || [ $permessi3 -gt 7 ]; then
        echo "Permesso non valido"
        exit
    fi
    permessi=$permessi1$permessi2$permessi3
    echo "I permessi sono: $permessi"
    chmod $permessi $file
    echo "I permessi sono stati applicati correttamente"
else
    echo "Il file non esiste"
    exit
fi
