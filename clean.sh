#!/bin/bash


clear
dialog --colors --title "Apt Flatpak yt-dlp" --yesno "\Z1Clear:\n\Z4Apt\n\Z1Remove:\n\Z4Unused Flatpaks\n\Z1Shred:\n\Z4PNG?\n\Z4=====================" 12 60
if [[ $? -eq 0 ]]; then
sudo apt-get autoclean
sudo apt-get autoremove --purge
sudo apt-get clean
flatpak uninstall --unused
du -hc /var/tmp/flatpak-cache-* | tail -1
yt-dlp --rm-cache-dir
rm -r /home/batan/.cache/mozilla/firefox/*
clear
dialog --title "OS Clean" --msgbox "Starting png shredding process" 0 0
ggg=$(sudo find /home/batan/.cache/thumbnails/ -type f -name "*.png"|wc -l)
clear
for i in $(sudo find /home/batan/.cache/thumbnails/ -type f -name "*.png");do clear && tput cup 3 15 && echo -e $ggg && shred -f $i && ((ggg--));done
dialog --colors --title "DROP CACHE" --yesno "\Z2 Do you want to echo 1 & 2" 12 60
if [[ $? -eq 0 ]]; then
echo 1|sudo tee /proc/sys/vm/drop_caches
echo 2|sudo tee /proc/sys/vm/drop_caches
clear
dialog --colors --yesno "\Z4 Swapp \Z1on/off?" 12 60
if [[ $? -eq 0 ]]; then
sudo swapoff -a
sudo swapon -a
dialog --colors --msgbox "\Z1 DONE CLEANING" 12 60



else
	sudo sweeper --automatic
fi


dialog --colors --msgbox "\Z1 DONE CLEANING" 12 60
fi
fi

clear
#$(find /home/*/.local/share/Trash -mindepth 1)
#for i in ;do sudo rm /var/log/unattended-upgrades/unattended-upgrades-shutdown.log;done
#for i in /var/log/journal/103a07d33f484a5b863f63dd1d4aa45c/user-1000.journal
#/var/log/journal/103a07d33f484a5b863f63dd1d4aa45c/system.journal
#/var/log/samba/log.humankind; do sudo rm /var/log/unattended-upgrades/unattended-upgrades-shutdown.log;done
