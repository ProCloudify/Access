#!/bin/bash

# Your SSH Public Key
SSH_KEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDr0NzVQIXILM0AN/Fq6sJQDzylZBteK4blpGvrYzOi azuread\\mijanurrahman@DESKTOP-GU545GC"

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
