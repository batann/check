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
echo -e ${Blue}'+--------------------------------------------------+'
echo -e ${Green}'              $(date +%H:%M)'
echo -e        '           Please Enter the URL to MMedia'
echo -e ${Blue}'+--------------------------------------------------+'
echo -e ${NC}
read -p        'URL:'  abc
yt-dlp -x --audio-format mp3 -o "%(title)s.%(ext)s" $abc
clear
mv *.mp3 /home/batan/Music/
echo -e ${Blue}'+--------------------------------------------------+'
echo -e ${Green} '             $(date +%H:%M)'
echo -e        '             DONE Press [any] to Exit'
echo -e ${Blue}'+--------------------------------------------------+'
read -n1 -p '' bcd
