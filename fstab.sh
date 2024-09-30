#!/bin/bash
clear
echo "Update fstab with data partition?"
echo ">>> 1) Yes"
echo ">>> 2) No"
tput cup 4 10
read -p 'Y/N' xxx
if [[ $xxx -eq 2 ]]; then

	echo "Fine"
else
#abc=$(sudo fdisk -l|grep 'sda'|grep -v 'sda1'|grep FAT|cut -c 1-9)
abc=$(sudo fdisk -l | grep "FAT" | grep -E "/dev/sd(a|b)" | grep -v sda1 | grep -v sdb1|awk '{print $5 " " $1}'|column -t|sort|tail -n1|awk '{print $2}')
bcd=$(sudo blkid $abc|awk '{print $4}')
 cde=$(echo $bcd|sed 's!$! /media/batan/100/ vfat defaults,noatime,noexec,nofail,rw,uid=batan,umask=0000,dmask=0011 0 0!g')

touch /home/batan/fstab
 sudo cat /etc/fstab >> /home/batan/fstab
 echo "$cde">>/home/batan/fstab
 sudo chown -R root:root /home/batan/fstab
 sudo mv /etc/fstab /etc/fstab.bak.$(date +%j%H%M)
 sudo mv /home/batan/fstab /etc/
fi
 clear
if [[ -d /media/batan/100/ ]]; 
then
	sudo chown -R batan:batan /media/batan/100/
else
sudo mkdir /media/batan/100/
sudo chown -R batan:batan /media/batan/100
fi
sudo mount -a
echo "DONE"
tput cup 10 5
read -n1 -p 'Press [Any] to Exit' xxx
