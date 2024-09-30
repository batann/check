#!/bin/bash


#CREATE USER
abc=$(ls /home/snapshot/ba* |sed 's/.*\///g'|cut -c 1-3|sort -u|tail -n1)
bcd=$(echo $abc|cut -c3)
((bcd++))
def=$(echo $abc|cut -c 1-2)$bcd
user_name=$def

sudo useradd -m -r $user_name
echo "$user_name:Ba7an?12982"|sudo chpasswd

#CREATE SYSTEM SNAPSHOT

sudo mx-snapshot --cli -r -z lz4 -l -Xhc -d /home/ -f $user_name_$(date +%j).iso

#CREATE README

touch /home/snapshot/README.$user_name.md
echo -e "- Created on	- $date" >> /home/snapshot/README.$user_name.md
echo -e "- Sydney Time  - $(date +%H:%M)" >> /home/snapshot/README.$user_name.md
echo -e "- User name	- $user_name" >> /home/snapshot/README.$user_name.md
echo -e "- Snapshot		- $user_name_$(date +%j).iso" >> /home/snapshot/README.$user_name.md
echo -e "- Scripts		- " >> /home/snapshot/README.$user_name.md
echo -e "- Comment		- no comments" >> /home/snapshot/README.$user_name.md
echo -e "- 10/10 batan 12982@tutanota.com - " >> /home/snapshot/README.$user_name.md
clear
echo -e "REDME.$user_name.md content:"
echo -e "================="
echo -e ""
cat /home/snapshot/README.$user_name.md
echo -e ""
echo -e "================="
echo -e ""
echo -e "DONE"
echo -e "===="



