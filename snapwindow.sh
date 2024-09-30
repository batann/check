#!/bin/bash
#   ANSI CODE   ##################################################################
Black='\033[0;30m'
Red='\033[0;31m'
Green='\033[0;32m'
Blue='\033[0;34m'
Purple='\033[0;35m'
Cyan='\033[0;36m'
Yellow='\033[1;33m'
White='\033[1;37m'
NC='\033[0m'
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################

clear
dialog --title "In Progress" --msgbox "Please complete the powermanager.sh script" 0 0
sudo -u batan bash settings.sh
#xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>Down' -s 'xfwm4-tile-down-key'
#xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>Up' -s 'xfwm4-tile-up-key'
#xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>Right' -s 'xfwm4-tile-right-key'
#xfconf-query -c xfce4-keyboard-shortcuts -n -t 'string' -p '/commands/custom/<Super>Left' -s 'xfwm4-tile-left-key'
#echo -e ${Yellow}'+------------------------------------------------------------------------------------+'
#echo -e ${Green}'		Alt Left			Alt Up'
#echo -e ${Green}'		Alt Right			Alt Down'
#echo -e ${Yellow}'+------------------------------------------------------------------------------------+'
