#!/bin/bash
#############################################################
#name:
#description:
#author: Fairdinkum Batan
#date:
#############################################################
clear
if [[ -d /home/batan/.config/xfce-superkey/ ]]; then
	echo "Superkey is already configured"
	read -n1 -p 'Press [any] to Exit' xxx
	exit 0
else
echo -e 'Getting Super config...'
cd
megaget /Root/xfce-superkey.tar.gz
tar fxz xfce-superkey.tar.gz
clear
echo -e 'Superkey configuration is in $HOME/.config/xfce-superkey/'
read -n1 -p '          >>> Press [Any] to Exit... <<<' xxx
fi
sudo -u batan bash settings.sh
