#!/bin/bash
#############################################################
#name:		keybinding.sh
#description:	personal xfce4 keyboard shortcuts postinstall settings
#author: Fairdinkum Batan
#date:		349
#############################################################


dialog --title "In Proggress" --msgbox "Complete the keyboard.sh script" 0 0 
sudo -u batan bash settings.sh
#sudo mv /home/batan/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml /home/batan/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml.bak
#sudo cp /home/batan/10/postinstall/xfce4-keyboard-shortcuts.xml /home/batan/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml


