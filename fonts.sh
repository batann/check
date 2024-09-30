#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################
clear
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

echo -e ${Cyan}'<<<------------------------------------->>>'
echo -e ${Blue}'    Getting Fonts & Themes from Cloud'
echo -e ${Cyan}'<<<------------------------------------->>>'
megaget /Root/fonts.tar.gz
megaget /Root/themes.tar.gz
sudo tar fxz fonts.tar.gz -C /usr/share/fonts/
sudo tar fxz themes.tar.gz -C /usr/share/themes/
rm fonts.tar.gz themes.tar.gz
clear
echo -e ${Cyan}'<<<------------------------------------->>>'
echo -e ${Blue}'      DONE. Press [any] to continue....'
echo -e ${Cyan}'<<<------------------------------------->>>'${Green}
read -n1 xxx
