#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################
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
############################################################################
ddd=$(date +%j)
clear
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
echo -e ${Cyan}'|      '${Green}' Enter the label for your disk:        '${Cyan}'|'
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
tput cup 4 0
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
tput cup 3 46
echo -e "${Cyan}|"
tput cup 3 0
echo -e "${Cyan}|${Yellow}               Label:${Purple} >>>${Yellow}   " 
tput cup 3 28
read abc
clear
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
echo -e ${Cyan}'|      '${Green}' Directory to be created on disk:      '${Cyan}'|'
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
tput cup 4 0
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
tput cup 3 46
echo -e "${Cyan}|"
tput cup 3 0
echo -e "${Cyan}|${Yellow} Directory to create:${Purple} >>>${Yellow}   " 
tput cup 3 28
read bbb
clear



echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}
echo -e ${Cyan}'|      '${Yellow}'    Please select target device:       '${Cyan}'|'
echo -e ${Cyan}"+${Blue}---------------------------------------------${Cyan}+"${Green}

echo -e ${White}""
options=$(sudo fdisk -l|grep -v 'sda'|grep -v 'Disk '|grep -v 'sdb'|grep 'dev/sd'|cut -c 1-8|sort -u);
tput cup 5 0
select disk in ${options[@]}
do
	sudo umount ${disk}1
	sudo umount ${disk}2
	sudo parted --script $disk mklabel msdos mkpart primary fat32 0% 100%
	sudo mkfs.vfat -F32 -n $abc ${disk}1
break
done
sudo mount ${disk}1 /mnt
sudo mkdir /mnt/$bbb
sudo chown -R batan:batan /mnt
sudo umount ${disk}1
	clear
echo -e ${Cyan}"+---------------------------------------------+"${Green}
echo -e ${Red}'                Your USB:'${Green}$abc
sudo fdisk -l|grep '$disk'
echo -e ${Cyan}"+---------------------------------------------+"${Green}
