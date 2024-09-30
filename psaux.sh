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
echo -e "${Purple}<<<<<${Yellow}-----------------------------------${Purple}>>>>>"
echo -e "        ${Green}Enter PID Description"
tput cup 3 0
echo -e "${Purple}<<<<<${Yellow}-----------------------------------${Purple}>>>>>"
tput cup 2 11
read -p ">>>>>     " abc
tput cup 4 15
echo -e "${Green}PID for ${White}$abc"
tput cup 5 11
echo -e "${Yellow}========================${Green}"
ps aux|grep $abc|awk '{print "           "$2}'
echo -e "           ${Yellow}========================"
echo -e "     ${Green}          kill -9?"
echo -e "            ${Purple}>>> ${White}1${Red}) ${White}Yes"
echo -e "            ${Purple}>>> ${White}2${Red}) ${White}No"
read -p "            >>>     " bcd
if [[ $bcd -eq 1 ]];
then

	exit 0

	for i in $(ps aux|grep $abc|grep -v grep|awk '{print $2}');do kill -9 $i > /dev/null/ 2>&1 ;done
	
echo -e "   >>>   DONE   <<<   "
	read -n1 -p "Press [Any] to Exit"
	exit 0
else
	echo -e "${Green}SELECTED NO${White}"
	read -n1 -p "Press [Any] to Exit"
	exit 0
fi
