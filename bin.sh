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
#   ANSI CODE BACKGROUND  ##################################################################
BBlue='\e[0;104m'
BBlack='\e[0;100m'
RRed='\e[0;100m'
GGreen='\e[0;100m'
YYellow='\e[0;100m'

#seperate config from bin files by creating a script exclusive to bin


###    095 bin files: 2mp3 2video axe caps cheat clean color download klin lc-menu lc-snapshot mp3 mus nuke pp toggle-decorations torrent video wiki



clear
echo -e ${Purple}'+------------------------------------------------+'
echo -e ${White}'   Create bin files?'
echo -e ${Blue} '========================='
echo -e ${Green}'   >>> '${Purple}'1'${Yellow}')' ${White}'Yes'
echo -e ${Green}'   >>> '${Purple}'2'${Yellow}')' ${White}'No'
echo -e ${Purple}'+------------------------------------------------+'${Green}
read -p 'Enter   >>>    ' ggg
if [[ $ggg -eq 1 ]]; then
sudo tar vfxz /home/batan/dot/bin.tar.gz --directory /usr/bin/
for i in $(tar list -f /home/batan/dot/bin.tar.gz);do sudo chmod +x /usr/bin/$i;done
clear
echo -e ${YYelow}"Following bin files where created:"
echo -e ${Purple}"=================================="${GGreen}
tar list -f /home/batan/dot/bin.tar.gz
echo ${NC}
else
clear
echo "Exiting...."
fi

