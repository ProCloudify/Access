#!/bin/bash

# Your SSH Public Key (use a single backslash, we escape it safely later)
RAW_KEY='ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJDr0NzVQIXILM0AN/Fq6sJQDzylZBteK4blpGvrYzOi azuread\mijanurrahman@DESKTOP-GU545GC'

# Escape the backslash dynamically so it survives when run via curl | bash
SSH_KEY=$(printf '%s\n' "$RAW_KEY" | sed 's/\\/\\\\/g')

# Create .ssh directory if not exists
mkdir -p ~/.ssh

# Ensure authorized_keys exists
touch ~/.ssh/authorized_keys

# Remove any old SSH keys that don't match your current one
grep -v -F "$SSH_KEY" ~/.ssh/authorized_keys > ~/.ssh/authorized_keys.tmp
mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys

# Add key if missing
if ! grep -qF "$SSH_KEY" ~/.ssh/authorized_keys; then
  echo "$SSH_KEY" >> ~/.ssh/authorized_keys
  echo "✅ SSH key added"
else
  echo "ℹ️ SSH key already exists and matches current key"
fi

# Fix permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown $(whoami):$(whoami) ~/.ssh -R

echo "✅ SSH setup complete."
