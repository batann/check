#!/bin/bash
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'
tput civis
clear
echo -e "${Cyan}=========================="
echo -e "${White}" "  Time Now: $(date +%H:%M)" "${Green}"
read -p '   How Many Mins: '  abc
cde=$(( abc *= 60 ))
bcd=$(date "+%s")
    for i in $(seq -f "%4g" $cde -1 0); do
        clear
    echo -e "${Cyan}=========================="
    echo -e "   ${Yellow}$i ${Green}Seconds to Go"
    echo -e "${Cyan}=========================="
        sleep 1
    done
    /usr/bin/paplay /home/batan/100/sounds/medieval-orchestra-announcement-.wav

