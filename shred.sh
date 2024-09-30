#!/bin/bash
timeis=$(date +%H-%M)
sudo apt-get autoremove --purge
sudo apt-get autoclean
sudo apt-get clean
rm -r /home/batan/.cache/mozilla/firefox/*
find ~/.cache/thumbnails -type f -name "*.png" -exec shred -f -u -z -n 1 {} \;
sudo systemctl -w vm.drop_caches=3
#on MX run sudo echo 3>/proc/sys/vm/drop_caches



notify-send -t 5000 "Shredding Complete" "<span color='Yellow' font='24px'
>Shredding Done     $timeis $ddd</span>"
dialog --backtitle "LC Linux" --msgbox "Droped caches 3" 5 50
dialog --backtitle "LC Linux" --yesno "ON-OFF Swap" 5 50
if [[ $? -eq 0 ]]; then
	sudo swapoff -a  &&
	sudo swapon -a &&
	dialog --msgbox "Swap has been disabled and restarted" 5 50
else
	dialog --msgbox "Thank You" 5 30
	fi
