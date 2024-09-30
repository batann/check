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


# Create a temporary script file
TMP_SCRIPT=$(mktemp /tmp/countdown_script.XXXXXX)
cat << 'EOL' > "$TMP_SCRIPT"

#!/bin/bash
clear
echo -e ${Blue}'+--------------------------------------------------+'
echo -e ${Green} $(date +%j:%H:%M)
echo -e ${NC}

sudo apt-get autoremove --purge
sudo apt-get autoclean
sudo apt-get clean
flatpak uninstall --unused
yt-dlp --rm-cache-dir
rm -r /home/batan/.cache/mozilla/firefox/*
sudo find /home/*/.local/share/Trash -mindepth 1 -exec rm -r {} \;
sudo rm /var/log/unattended-upgrades/unattended-upgrades-shutdown.log
for i in $(sudo ls -a /var/cache/apt/archives/partial/);do sudo rm $i;done
sudo find /var/log -type f -exec rm -r {} \;
sudo find /home/batan/.cache/thumbnails/ -type f -name "*.png" -exec shred -f -n1 -u -z {} \;
echo 1|sudo tee /proc/sys/vm/drop_caches
echo 2|sudo tee /proc/sys/vm/drop_caches
sudo sweeper --automatic
sudo bleachbit -preset -c
sudo -a swappoff
sudo -a swapon
clear
echo -e 'DONE'
read -n1 -p 'Press [Any] to Finish...' xxx
EOL
xterm -geom 100x40-0+0 -e bash -c "sudo -u batan bash $TMP_SCRIPT"
