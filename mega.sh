#!/bin/bash


dialog --title "In Progress" --yesno "Create user megarc and setup megacloud?" 0 0
if [[ $? -eq 0 ]]; then
	touch /home/batan/.megarc
	echo "[Login]" >>/home/batan/.megarc
	echo "Username=tel.petar@gmail.com">>/home/batan/.megarc
	echo "Password=Ba7an?12982">>/home/batan/.megarc
	clear 
	megals
	echo -e '+------------------------------+'
	echo -e 'Contents of your account'
	read -n1 -p 'Press [any] to Continue....' abc
	clear 
	sudo -u batan bash settings.sh
else
	sudo -u batan bash settings.sh
fi

