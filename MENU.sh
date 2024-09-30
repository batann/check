#!/bin/bash

# Assign Variables:
# LM = items in directory
clear

E='echo -e'; e='echo -en'; trap "R; exit" 2
ESC=$( $e "\e")
TPUT() { $e "\e[${1};${2}H"; }
CLEAR() { $e "\ec"; }
CIVIS() { $e "\e[?25l"; }
DRAW() { $e "\e%@\e(0"; }
WRITE() { $e "\e(B"; }
MARK() { $e "\e[7m"; }
UNMARK() { $e "\e[27m"; }
R() { CLEAR; stty sane; $e "\ec\e[30;42m\e[J"; }
HEAD() {
    DRAW
    for each in $(seq 1 18); do
        $E "   x                          x"
    done
    WRITE; MARK; TPUT 1 5
    $E "     Useful Software     "; UNMARK;
}
i=0; CLEAR; CIVIS; NULL=/dev/null
FOOT() { MARK; TPUT 18 5
    printf "     Privacy Matters      "; UNMARK;
}
ARROW() {
    read -s -n3 key 2>/dev/null >&2
    if [[ $key = $ESC[A ]]; then echo up; fi
    if [[ $key = $ESC[B ]]; then echo dn; fi
}

# Read commands from file
declare -a options
declare -a commands
while IFS= read -r line; do
    option=$(echo $line | awk -F'"' '{print $2}')
    command=$(echo $line | awk -F'"' '{print $4}')
    options+=("$option")
    commands+=("$command")
done < commands.txt

# Generate menu functions dynamically
for idx in "${!options[@]}"; do
    eval "M$idx() { TPUT $((3 + idx)) 10; $e \"${options[$idx]}\"; }"
done
LM=${#options[@]}
LM=$((LM - 1))

MENU() { for each in $(seq 0 $LM); do M${each}; done; }
POS() {
    if [[ $cur == up ]]; then ((i--)); fi
    if [[ $cur == dn ]]; then ((i++)); fi
    if [[ $i -lt 0 ]]; then i=$LM; fi
    if [[ $i -gt $LM ]]; then i=0; fi
}
REFRESH() {
    after=$((i + 1)); before=$((i - 1))
    if [[ $before -lt 0 ]]; then before=$LM; fi
    if [[ $after -gt $LM ]]; then after=0; fi
    if [[ $j -lt $i ]]; then UNMARK; M$before; else UNMARK; M$after; fi
    if [[ $after -eq 0 ]] || [ $before -eq $LM ]; then
        UNMARK; M$before; M$after;
    fi
    j=$i;
}

# Main loop
R; HEAD; FOOT; MENU
while true; do
    TPUT $((3 + i)) 10; MARK; $e "${options[$i]}"; UNMARK;
    cur=$(ARROW)
    POS
    REFRESH
    if [[ $cur == "" ]]; then
        eval "${commands[$i]}"
    fi
done


