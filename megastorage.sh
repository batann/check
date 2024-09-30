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
clear


TMP_SCRIPT=$(mktemp /tmp/countdown_script.XXXXXX)
cat << 'EOL' > "$TMP_SCRIPT"
#!/usr/bin/env bash
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'

clear
 echo -e ${Cyan}"=================================================" 
 tput cup 20 0 
 echo -e ${Cyan}"=================================================" 
 tput cup 3 5 
 echo -e ${Cyan}">>>>"${Purple}"    Files stored in MEGACLOUD:" 
 tput cup 4 5 
 echo -e ${Cyan}"=================================="${Green} 
 tput cup 5 0 
 options=$(megals|grep -v /Root/10 |grep -v /Root/100 |grep -v /Root/dot |grep -v /Root/check |grep -v /Root/MEGA |grep -v Inbox |grep -v WARNING |grep -v 12982| grep -v Trash|grep -v 2023 |grep -v 2024|grep -v Contact|sed 's!/Root/!!g'); select file in ${options[@]}; do megaget /Root/$file;done

EOL
xterm -geom 110x40+0+0 -e "sudo -u batan bash $TMP_SCRIPT"


