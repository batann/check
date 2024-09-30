#!/bin/bash
clear
abc=$(curl -s "http://worldtimeapi.org/api/ip"|sed 's/,/\n/g'|grep 'timezo'|sed 's/"timezone"://g'|sed 's/"//g')
dialog --colors --title "Set Local TimeZone" --yesno "\Z4Would You like the TimeZone to be set to \Z1$abc" 10 40
if [[ $? -eq 0 ]]; then
  sudo timedatectl set-timezone $abc
  dialog --colors --msgbox "\Z1Thank You" 10 40
  sudo -u batan bash settings.sh
else
  dialog --colors --msgbox "\Z1Thank You" 10 40
clear
sudo -u batan bash settings.sh
fi
