#!/bin/bash

set -euo pipefail

# Echo a message
echo "Starting Node.js installation..."

# Update package index
sudo apt-get update

# Install curl if not available
if ! command -v curl &>/dev/null; then
    echo "Installing curl..."
    sudo apt-get install -y curl
fi

# Download and run the NodeSource setup script (for Node.js 18)
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -

# Install Node.js
sudo apt-get install -y nodejs

# Verify installation
echo "Node.js version:"
node -v

echo "npm version:"
npm -v

echo "Node.js installation completed!"
