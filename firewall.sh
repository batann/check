#!/bin/bash
dialog --title "DONE" --yesno "Allow traffic on 35-40?" 0 0
if [[ $? -eq 0 ]]; then

sudo apt install ufw -y
sudo ufw allow from 192.168.1.35
sudo ufw allow from 192.168.1.36
sudo ufw allow from 192.168.1.37
sudo ufw allow from 192.168.1.38
sudo ufw allow from 192.168.1.39
sudo ufw allow from 192.168.1.40
sudo ufw allow to 192.168.1.35
sudo ufw allow to 192.168.1.36
sudo ufw allow to 192.168.1.37
sudo ufw allow to 192.168.1.38
sudo ufw allow to 192.168.1.39
sudo ufw allow to 192.168.1.40
sudo ufw enable
clear
sudo -u batan bash settings.sh
else
	sudo -u batan bash settings.sh
fi
