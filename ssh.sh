#!/bin/bash
dialog --title "SSH keys" --yesno "Create SSH Keys?" 0 0
if [[ $? -eq 0 ]]; then
clear
# Set the default key name and location
key_name="id_rsa"
key_location="$HOME/.ssh/$key_name"

# Generate SSH key pair without passphrase
ssh-keygen -t rsa -b 4096 -f "$key_location" -N ""

# Display the public key
echo "Generated SSH key pair:"
cat "${key_location}.pub"

dialog --colors --title "DONE" --msgbox "Key pair has been \nsaved to\n\Z1 $key_location" 0 0
sudo -u batan bash settings.sh
else
	sudo -u batan bash settings.sh
fi
