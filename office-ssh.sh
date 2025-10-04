#!/bin/bash

# ==========================================================
# Permanent SSH setup script for Windows key on Linux VPS
# Author: Mijanur Rahman
# Works with: curl -sSL https://raw.githubusercontent.com/ProCloudify/Access/refs/heads/main/setup-ssh.sh | bash
# ==========================================================

# Base64-encoded version of your Windows SSH key
ENCODED_KEY="c3NoLWVkMjU1MTkgQUFBQUMzTnphQzFsWkRJMU5URTVBQUFBSUpEcjBOelZRSVhJTE0wQU4vRnE2c0pRRHp5bFpCdGVLNGJscEd2cll6T2kgYXp1cmVhZFxtaWphbnVycmFobWFuQERFU0tUT1AtR1U1NDVDQw=="

# Decode safely
SSH_KEY=$(echo "$ENCODED_KEY" | base64 -d)

# Create .ssh folder if missing
mkdir -p ~/.ssh

# Ensure authorized_keys file exists
touch ~/.ssh/authorized_keys

# Remove any duplicate entries
grep -v -F "$SSH_KEY" ~/.ssh/authorized_keys > ~/.ssh/authorized_keys.tmp && mv ~/.ssh/authorized_keys.tmp ~/.ssh/authorized_keys

# Add key if not already present
if ! grep -qF "$SSH_KEY" ~/.ssh/authorized_keys; then
  echo "$SSH_KEY" >> ~/.ssh/authorized_keys
  echo "✅ SSH key added successfully"
else
  echo "ℹ️ SSH key already present"
fi

# Set proper permissions
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
chown -R $(whoami):$(whoami) ~/.ssh

echo "✅ SSH setup complete and secure."
