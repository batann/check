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
###################################################################
clear
mkdir /home/batan/Videos/1/
cd /home/batan/Videos/1/
read -p        'URL:'  abc
bcd=$(dialog --title "Name" --inputbox "URL:" 8 90  3>&1 1>&2 2>&3 3>&- )
#if [[ $bcd -eq n ]] 
#then
#	xxx=$(yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" $abc)
#else
xxx=$(yt-dlp $abc)
fi
mv $xxx /home/batan/Videos/
clear
echo -e ${Blue}'+--------------------------------------------------+'
echo -e ${Green} '             $(date +%H:%M)'
echo -e ${Green} '     MP4 $xxx is in ${Yellow}Video{Green} Directory''
echo -e        '             DONE Press [any] to Exit'
echo -e ${Blue}'+--------------------------------------------------+'
read -n1 -p '' bcd
