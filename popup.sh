#!/usr/bin/env sh
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'


fff=$(date +%H:%M)
tput civis
clear
tput cup 4 0
echo -e "${Cyan}=========================="
tput cup 0 0
echo -e "${Cyan}=========================="
echo -e "${White}" "    Time Now: $(date +%H:%M)" "${Purple}"
 /usr/bin/paplay /home/batan/check/setcountdown.wav
echo -e '      How Many Mins: '
tput cup 5 0
read -p '     >>> ' abc
/usr/bin/paplay /home/batan/check/whatdisplay.wav

tput cup 3 0
echo -e "${Yellow}   Reminder to DISPLAY:" 
tput cup 6 0
read -p '     >>> ' xxx
cde=$(( abc *= 60 ))
bcd=$(date "+%s")
    for i in $(seq -f "%4g" $cde -1 0); do
        clear
    echo -e "${Cyan}=========================="
    echo -e "   ${Yellow}$i ${Green}Seconds to Go"
    echo -e "${Cyan}=========================="
	sleep 1
    done

	/usr/bin/paplay /home/batan/check/timeisup.wav
	clear



xterm -geom 120x40 -e bash -c "dialog --title 'ATTENTION' --msgbox '$xxx' 8 50"
clear
echo -e "${Purple}<<<${Red}-----------${Purple}>>>"
echo -e "   ${Cyan}Started:"
echo -e "   ${Green}$fff"
echo -e "${Purple}<<<${Red}-----------${Purple}>>>"
echo -e "${Cyan}   Time Now:"
echo -e "${Green}   $(date +%H:%M)"
echo -e "${Purple}<<<${Red}-----------${Purple}>>>"

