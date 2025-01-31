# Controlla se il file archivio_libri.txt esiste
# L'opzione -f verifica se il file esiste e se è un file regolare
if [ ! -f archivio_libri.txt ]; then
    # Se il file non esiste, viene creato un nuovo file vuoto con il comando touch
    touch archivio_libri.txt
fi

# Array archivio
archivio=()

# Legge il file archivio_libri.txt e aggiunge i libri all'array archivio
while true= read -r txt; do
    archivio+=("$txt")
done <archivio_libri.txt

# Funzione per visualizzare il menu principale
function menu_principale() {
    # Pulisce lo schermo del terminale
    clear
    # Stampa le opzioni del menu principale
    echo "1. Aggiungi un libro"
    echo "2. Cerca un libro"
    echo "3. Visualizza tutti i libri"
    echo "4. Ottimizza archivio"
    echo "5. Esci"
    echo ""
}

# Funzione per attendere l'input dell'utente prima di continuare
function wait_and_continue() {
    # Mostra un messaggio e attende che l'utente prema un tasto
    read -p "Premi un tasto per continuare..."
}

# Funzione per aggiungere un libro
function aggiungi_libro() {
    clear
    echo "Hai scelto: Aggiungi un libro"
    # Ciclo infinito per permettere all'utente di inserire i dati corretti
    while true; do
        read -p "Inserisci il titolo del libro: " titolo
        # Controlla se il titolo contiene solo lettere, spazi e numeri
        if [[ ! "$titolo" =~ ^[a-zA-Z0-9\ ]+$ ]]; then
            echo "Titolo non valido. Deve contenere solo lettere, spazi e numeri."
            continue
        fi
        read -p "Inserisci l'autore del libro: " autore
        # Controlla se l'autore contiene solo lettere e spazi
        if [[ ! "$autore" =~ ^[a-zA-Z\ ]+$ ]]; then
            echo "Autore non valido. Deve contenere solo lettere e spazi."
            continue
        fi
        read -p "Inserisci l'anno di pubblicazione del libro (4 cifre): " anno
        # Controlla se l'anno inserito è un numero di 4 cifre
        if [[ ! "$anno" =~ ^[0-9]{4}$ ]]; then
            # Se l'anno non è valido, stampa un messaggio di errore e ricomincia il ciclo
            echo "Anno non valido. Deve essere un numero di 4 cifre."
            continue
        fi
        # Combina il titolo, l'autore e l'anno in una singola stringa
        libro="$titolo - $autore - $anno"
        # Variabile per tenere traccia dei duplicati
        duplicato=false
        # Itera su tutti gli elementi dell'array archivio per verificare la presenza di duplicati
        for elemento in "${archivio[@]}"; do
            # Se trova un duplicato, imposta la variabile duplicato a true e interrompe il ciclo
            if [[ "$elemento" == *"$libro"* ]]; then
                duplicato=true
                break
            fi
        done
        # Se è stato trovato un duplicato, stampa un messaggio di errore
        if [ "$duplicato" = true ]; then
            echo "Libro già presente nell'archivio."
        else
            # Se non ci sono duplicati, aggiunge il libro all'array archivio e al file archivio_libri.txt
            archivio+=("$libro")
            echo "$libro" >>archivio_libri.txt
            echo "Libro aggiunto con successo."
            break
        fi
    done
    # Attende che l'utente prema un tasto prima di continuare
    wait_and_continue
    return
}

# Funzione per cercare un singolo libro
function cerca_libro() {
    clear
    echo "Hai scelto: Cerca un libro"
    echo "1. Cerca per titolo"
    echo "2. Cerca per autore"
    echo "3. Cerca per anno"
    read -p "Scegli un'opzione: " opzione
    case $opzione in
    1)
        read -p "Inserisci il titolo del libro da cercare: " ricerca
        ;;
    2)
        read -p "Inserisci l'autore del libro da cercare: " ricerca
        ;;
    3)
        read -p "Inserisci l'anno di pubblicazione del libro da cercare: " ricerca
        ;;
    *)
        echo "Opzione non valida!"
        return
        ;;
    esac
    # Variabile per tenere traccia se un libro è stato trovato
    trovato=false
    # Contatore per l'indice
    indice=0
    # Ciclo for per iterare su tutti gli elementi dell'array archivio
    for libro in "${archivio[@]}"; do
        # Controlla se il libro contiene la stringa di ricerca
        if [[ "$libro" == *"$ricerca"* ]]; then
            # Se il libro è trovato, stampa il libro e l'indice
            echo "Libro trovato: ${libro} all'indice ${indice}"
            trovato=true
        fi
        # Incrementa l'indice
        ((indice++))
    done

    # Se nessun libro è stato trovato, stampa un messaggio
    if [[ "$trovato" == false ]]; then
        echo "Libro non trovato!"
    fi

    # Attende che l'utente prema un tasto prima di continuare
    wait_and_continue
}

# Funzione per visualizzare tutti i libri
function visualizza_libri() {
    clear
    echo "Hai scelto visualizza tutti i libri"
    # Inizia un ciclo for per iterare su tutti gli elementi dell'array archivio
    for libro in "${archivio[@]}"; do
        # Stampa l'elemento corrente dell'array archivio
        echo "${libro}"
    done
    # Attende che l'utente prema un tasto prima di continuare
    wait_and_continue
    return
}

function ottimizza_archivio() {
    # Sort per anno di pubblicazione
    sort -t '-' -k3 archivio_libri.txt >archivio_libri_temp.txt
    mv archivio_libri_temp.txt archivio_libri.txt
    # Stampa elementi ordinati
    echo "Archivio ottimizzato con successo."
    while read -r libro; do
        echo "$libro"
    done <archivio_libri.txt
    wait_and_continue
    return

}

function esci() {
    echo "Uscita in corso..."
    exit 0
}

while true; do
    clear
    menu_principale
    read -p "Scegli un'opzione : " scelta
    case $scelta in
    1)
        aggiungi_libro
        ;;
    2)
        cerca_libro
        ;;
    3)
        visualizza_libri
        ;;
    4)
        ottimizza_archivio
        ;;
    5)
        esci
        ;;
    *)
        echo "Scelta non valida !"
        wait_and_continue
        ;;
    esac
done
