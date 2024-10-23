#!/bin/bash

# URL of the aisense script
AISENSE_REPO_URL="https://raw.githubusercontent.com/cksjava/aisense-cli/master/aisense"

# Installation directory (usually /usr/local/bin for global access)
INSTALL_DIR="/usr/local/bin"

# Check if the user has write permission to the installation directory
if [ ! -w "$INSTALL_DIR" ]; then
  echo "You don't have permission to write to $INSTALL_DIR. Try running the script with sudo."
  exit 1
fi

# Download the aisense script
echo "Downloading aisense..."
curl -L "$AISENSE_REPO_URL" -o "$INSTALL_DIR/aisense"

# Make the script executable
echo "Making aisense executable..."
chmod +x "$INSTALL_DIR/aisense"

# Verify installation
if command -v aisense > /dev/null; then
  echo "aisense has been installed successfully!"
  echo "You can now use the 'aisense' command."
else
  echo "Installation failed. Please check your installation directory and permissions."
fi
