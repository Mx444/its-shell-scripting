function is_integer() {
    [[ "$1" =~ ^-?[0-9]+$ ]]
}

function wait_and_continue() {
    read -p "Premi un tasto per continuare..."
}

function somma() {
    read -p "Quanti valori vuoi sommare? " n
    if ! is_integer "$n" || ((n < 1)); then
        echo "Errore: devi inserire un numero intero maggiore di zero."
        wait_and_continue
        return
    fi

    local somma
    read -p "Inserisci il primo valore : " somma
    if ! is_integer "$somma"; then
        echo "Errore: devi inserire un numero intero. Riprova."
        wait_and_continue
        return
    fi

    for ((i = 2; i <= n; i++)); do
        read -p "Inserisci il valore $i: " val
        if is_integer "$val"; then
            somma=$((somma + val))
        else
            echo "Errore: devi inserire un numero intero. Riprova."
            ((i--))
        fi
    done

    echo "Risultato somma: $somma"
    wait_and_continue
}

function sottrazione() {
    read -p "Quanti valori vuoi sottrarre? " n
    if ! is_integer "$n" || ((n < 1)); then
        echo "Errore: devi inserire un numero intero positivo maggiore di zero."
        wait_and_continue
        return
    fi

    local sottrazione
    read -p "Inserisci il primo valore: " sottrazione
    if ! is_integer "$sottrazione"; then
        echo "Errore: devi inserire un numero intero."
        wait_and_continue
        return
    fi

    for ((i = 2; i <= n; i++)); do
        read -p "Inserisci il valore $i: " val
        if is_integer "$val"; then
            sottrazione=$((sottrazione - val))
        else
            echo "Errore: devi inserire un numero intero. Riprova."
            ((i--))
        fi
    done

    echo "Risultato sottrazione: $sottrazione"
    wait_and_continue
}

function moltiplicazione() {
    read -p "Quanti valori vuoi moltiplicare? " n
    if ! is_integer "$n" || ((n < 1)); then
        echo "Errore: devi inserire un numero intero positivo maggiore di zero."
        wait_and_continue
        return
    fi

    local moltiplicazione=1
    for ((i = 1; i <= n; i++)); do
        read -p "Inserisci il valore $i: " val
        if is_integer "$val"; then
            moltiplicazione=$((moltiplicazione * val))
        else
            echo "Errore: devi inserire un numero intero. Riprova."
            ((i--))
        fi
    done

    echo "Risultato moltiplicazione: $moltiplicazione"
    wait_and_continue
}

function divisione() {
    read -p "Inserisci il primo valore: " num1
    if ! is_integer "$num1"; then
        echo "Errore: devi inserire un numero intero."
        wait_and_continue
        return
    fi

    read -p "Inserisci il secondo valore: " num2
    if ! is_integer "$num2" || ((num2 == 0)); then
        echo "Errore: devi inserire un numero intero diverso da zero."
        wait_and_continue
        return
    fi

    local risultato=$((num1 / num2))
    echo "Risultato divisione: $risultato"
    wait_and_continue
}

function esci() {
    echo "Uscita in corso..."
    exit 0
}

while true; do
    clear
    echo "===== Menu ====="
    echo "1) Somma"
    echo "2) Sottrazione"
    echo "3) Moltiplicazione"
    echo "4) Divisione"
    echo "5) Esci"
    echo "================"
    read -p "Scegli un'opzione: " scelta

    case $scelta in
    1) somma ;;
    2) sottrazione ;;
    3) moltiplicazione ;;
    4) divisione ;;
    5) esci ;;
    *) echo "Opzione non valida. Riprova." && wait_and_continue ;;
    esac
done
