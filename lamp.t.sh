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
###############################################
clear
xfce4-terminal --geometry=80x50+100+100 --hide-borders --hide-menubar --hide-scrollbar --zoom=-1 -e 'tmux new-session "sudo -u batan bash lamp.sh" \; splitp -v -p15 \; selectp -t0 \;'

