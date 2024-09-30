#!bin/bash

sudo usermod -aG batan $USER
sudo usermod -aG lp $USER
sudo usermod -aG dialout $USER
sudo usermod -aG cdrom $USER
sudo usermod -aG floppy $USER
sudo usermod -aG sudo $USER
sudo usermod -aG audio $USER
sudo usermod -aG dip $USER
sudo usermod -aG video $USER
sudo usermod -aG plugdev $USER
sudo usermod -aG users $USER
sudo usermod -aG netdev $USER
sudo usermod -aG lpadmin $USER
sudo usermod -aG scanner $USER
sudo usermod -aG vboxsf $USER
sudo usermod -aG sambashare $USER
sudo usermod -aG adm $USER
sudo usermod -aG bluetooth $USER
sudo usermod -aG netdev $USER
sudo usermod -aG systemd-journal $USER


###         ###############
clear
abc=$(curl -s "http://worldtimeapi.org/api/ip"|sed 's/,/\n/g'|grep 'timezo'|sed 's/"timezone"://g'|sed 's/"//g')
  sudo timedatectl set-timezone $abc
###         ###############
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
###         ###############
	echo "batan ALL=(ALL:ALL) NOPASSWD:ALL"|sudo EDITOR='tee -a' visudo
xmodmap -e "clear lock"
xmodmap -e "remove Control = Control_L"
xmodmap -e "keycode 66 = Control_L"
xmodmap -e "add Control = Control_L"
xcape -e "Control_L=Escape"
###         ###############
clear
ddd=$(date +%j)
mkdir -p $HOME/.cache/calendar.vim/
mkdir -p $HOME/.config/nvim/pack/plugins/start/
mkdir -p $HOME/.config/nvim/templates/
mkdir -p $HOME/.vim/templates
mkdir -p $HOME/.vim/pack/plugins/start/
clear
mkdir /home/batan/.cache/calendar.vim/
cp /home/batan/dot/credentials.vim /home/batan/.cache/calendar.vim
sudo -u batan bash /home/batan/check/caps.sh
clear
	sudo cp /home/batan/dot/templates/* /home/batan/.vim/templates/
	sudo cp /home/batan/dot/templates/* /home/batan/.config/nvim/templates/
sudo tar vfxz /home/batan/dot/bin.tar.gz --directory /usr/bin/
for i in $(tar list -f /home/batan/dot/bin.tar.gz);do sudo chmod a+x /usr/bin/$i;done
	mv $HOME/.bashrc $HOME/.bashrc.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/bashrc $HOME/.bashrc
	mv $HOME/.bashrc.aliases $HOME/.bashrc.alaises.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/bashrc.aliases $HOME/.bashrc.aliases
	mv $HOME/.vimrc $HOME/.vimrc.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/vimrc $HOME/.vimrc
	mv $HOME/.taskrc $HOME/.taskrc.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/taskrc $HOME/.taskrc
	mv $HOME/.xboardrc $HOME/.xboardrc.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/xboardrc $HOME/.xboardrc
	mv $HOME/.tkremind $HOME/.tkremind.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/tkremind $HOME/.tkremind
	mv $HOME/.xterm.conf $HOME/.xterm.conf.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/xterm.conf $HOME/.xterm.conf
	mv $HOME/.Xresources $HOME/.Xresources.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/Xresources $HOME/.Xresources
	mv $HOME/.bash_profile $HOME/.bash_profile.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/bash_profile $HOME/.bash_profile
	mv $HOME/.tmux.config $HOME/.tmux.config.bak.$ddd.$(date +%H:%M)
	ln -s $HOME/dot/tmux.config $HOME/.tmux.config
	mv $HOME/.config/featherpad/fp.conf $HOME/.config/featherpad/fp.conf.bak.$ddd.$(date +%H:%M)
	cp $HOME/dot/fp.conf $HOME/.config/featherpad/fp.conf
	mv $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tpl $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp.$ddd.$(date +%H:%M)
	cp $HOME/dot/default.tlp $HOME/.vim/pack/plugins/start/vimwiki/autoload/vimwiki/default.tlp
abc=$(sudo fdisk -l | grep "FAT" | grep -E "/dev/sd(a|b)" | grep -v sda1 | grep -v sdb1|awk '{print $5 " " $1}'|column -t|sort|tail -n1|awk '{print $2}')
bcd=$(sudo blkid $abc|awk '{print $4}')
 cde=$(echo $bcd|sed 's!$! /media/batan/100/ vfat defaults,noatime,noexec,nofail,rw,uid=batan,umask=0000,dmask=0011 0 0!g')
touch /home/batan/fstab
 sudo cat /etc/fstab >> /home/batan/fstab
 echo "$cde">>/home/batan/fstab
 sudo chown -R root:root /home/batan/fstab
 sudo mv /etc/fstab /etc/fstab.bak.$(date +%j%H%M)
 sudo mv /home/batan/fstab /etc/
sudo mkdir /media/batan/100/
sudo chown -R batan:batan /media/batan/100
sudo mount -a
clear
# Check if GPG is installed
# Set key details
full_name="fairdinkum batan"
email_address="12982@tutanota.com"
passphrase="Ba7an?12982"

# Generate GPG key
gpg --batch --full-generate-key <<EOF
    Key-Type: RSA
    Key-Length: 4096
    Subkey-Type: RSA
    Subkey-Length: 4096
    Name-Real: $full_name
    Name-Email: $email_address
    Expire-Date: 1y
    Passphrase: $passphrase
    %commit
EOF
clear
echo "GPG key generation completed. Please make sure to remember your passphrase."
###         ###############
clear
key_name="id_rsa"
key_location="$HOME/.ssh/$key_name"
ssh-keygen -t rsa -b 4096 -f "$key_location" -N ""

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
read -n1 -p    '           Press [any] to Continue...'


###   FONTS ICONS THEMES   ###

megaget /Root/fonts.tar.gz
sudo tar fxz fonts.tar.gz --directory /usr/share/fonts/
sudo trash fonts.tar.gz
megaget /Root/icons.tar.gz
sudo tar fxz icons.tar.gz --directory /usr/share/icons/
sudo trash icons.tar.gz
megaget /Root/themes.tar.gz
tar fxz themes.tar.gz --directory /usr/share/themes
sudo trash icons.tar.gz

