#!/bin/bash
ddd=$(date +%j)
acc=$(yad --undecorated --image-on-top --gtk-theme --image="/home/batan/100/icons/icon-a3-hub.128.png"  --no-buttons --text="File Name: XXX.txt" --width=300 --entry)

clear
/usr/bin/featherpad $acc.$ddd.txt
