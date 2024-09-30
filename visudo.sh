#!/bin/bash
clear
dialog --title "Visudo" --yesno "Allow user no password" 0 0
if [[ $? -eq 0 ]]; then
	echo "batan ALL=(ALL:ALL) NOPASSWD:ALL"|sudo EDITOR='tee -a' visudo
	sudo -u batan bash settings.sh
	else 
		sudo -u batan bash settings.sh
fi

