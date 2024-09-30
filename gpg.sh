#!/bin/bash
clear
# Check if GPG is installed
command -v gpg >/dev/null 2>&1 || { echo >&2 "GPG is not installed. Please install GPG and try again."; exit 1; }

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
read -n1 -p ' Press [any] to Continue ....' abc
sudo -u batan bash settings.sh
