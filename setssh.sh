#!/bin/bash

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
ddd=$(date +%j)
	clear
echo -e ${Cyan}'+----------------------------------------------+'${Green}
echo -e        '           Setting ssh keys on remote  '
echo -e ${Cyan}'+----------------------------------------------+'${Green}


# Function to configure SSH on a remote machine
configure_ssh() {
    # SSH configuration file path
    ssh_config="/etc/ssh/sshd_config"

    # Combine all SSH configuration changes into one command
    ssh -o "StrictHostKeyChecking=no" -o "PasswordAuthentication=no" "$1" "\
        sudo sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/' $ssh_config && \
        sudo sed -i 's/#AuthorizedKeysFile/AuthorizedKeysFile/' $ssh_config && \
        sudo service ssh restart"
}

active_ips=()
local_ip=$(hostname -I | awk '{print $1}')

for i in $(seq 35 40); do
    current_ip="192.168.1.$i"
    if [ "$current_ip" != "$local_ip" ] && ping -s90 -i1 -c1 "$current_ip" &> /dev/null; then
        active_ips+=("$current_ip")
    fi
done

for ip in "${active_ips[@]}"; do
    ssh-copy-id -i ~/.ssh/id_rsa.pub batan@"$ip"
done
clear

echo -e ${Cyan}'+----------------------------------------------+'${Green}
echo -e        '      SSH Keys on remote Machine are setup '
echo -e ${Cyan}'+----------------------------------------------+'${Red}
read -n1 -p    '           Press [any] to Continue...'
sudo -u batan bash settings.sh

