#!/bin/bash

# Your SSH Public Key
SSH_KEY="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDVqwjfvr8tOAGievcNRq7haRVr5oiUzYYxM6dHJr44ICSox5RaYSX2S6fXnP/bWKaGIqoc2WbnOzcA0AB4HOy9xFBGe3sTMc4n8I9TCTH0hatLZQigWbeg0UUEY4RjZZWCS4VPr9u4SeqFOirWeEEQlc/hGSzC8gu3aPvMYzLOZ3gfPZkmM4swhZcdvdNAObNShL6GakbmA8IAiQ8cyJy6iTNeqcML4xX8czmZOrTF3Qd0bwFGfvF4S1OIm+WZiDmWhMhaeUO98OzgLmyqaIocYdFw5f9R5ligr3Q0Ex0MBgjX9i3fi4M3pKlf/9Bhvaaewjtshk0X4pCw+h8LVXqPjCKmPxEqPEAFR0wQ1iI0Fj3i7naoqhP0v6brrnR6x5wsWi8badW9lXscEmwqRa/59HCRpTezHDA8tBZSdZyutC7k5WIBuliie5gYQu9a/1Z1sWlKt6GboFG3Qs5gp1vMMY1rezIecj+ITCWrBU3OLt6ox3AkBN7ZxFOZG90wQOM= lios@Mijanurs-MacBook-Air.local"

# Create .ssh directory if not exists
mkdir -p ~/.ssh

# Add the SSH key if not already present
if ! grep -q "$SSH_KEY" ~/.ssh/authorized_keys 2>/dev/null; then
  echo "$SSH_KEY" >> ~/.ssh/authorized_keys
  echo "✅ SSH key added to authorized_keys"
else
  echo "ℹ️ SSH key already exists in authorized_keys"
fi

# Set secure permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys

echo "✅ SSH setup complete."
