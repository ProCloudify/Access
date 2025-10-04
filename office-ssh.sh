#!/bin/bash

# Your SSH Public Key
SSH_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDr0NzVQIXILM0AN/Fq6sJQDzylZBteK4blpGvrYzOi azuread\\\\mijanurrahman@DESKTOP-GU545GC"

# Create .ssh directory if not exists
mkdir -p ~/.ssh

# Ensure authorized_keys exists
touch ~/.ssh/authorized_keys

# Remove any old SSH keys that don't match your current one
grep -v -F "$SSH_KEY" ~/.ssh/authorized_keys > ~/.ssh/authorized_keys.tmp
mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys

# Check if key is already present
if ! grep -qF "$SSH_KEY" ~/.ssh/authorized_keys; then
  echo "$SSH_KEY" >> ~/.ssh/authorized_keys
  echo "✅ New SSH key added"
else
  echo "ℹ️ SSH key already exists and matches current key"
fi

# Set secure permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown $(whoami):$(whoami) ~/.ssh -R

echo "✅ SSH setup complete and old keys cleaned."
