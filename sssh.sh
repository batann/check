#!/bin/bash

local_ip=$(hostname -I | awk '{print $1}')

for i in $(seq 35 40); do
    current_ip="192.168.1.$i"
    if [ "$current_ip" != "$local_ip" ] && ping -s90 -i1 -c1 "$current_ip" &> /dev/null; then
        active_ips+=("$current_ip")
    fi
done
abc=$(echo $active_ips|awk '{print $1}') 
nohup xterm -geom 120x50+0-0 -hold -e bash -c "sudo ssh batan@$abc" 

