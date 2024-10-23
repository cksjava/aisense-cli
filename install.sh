#!/bin/bash

# URL of the aisense CLI script
AISENSE_URL="https://raw.githubusercontent.com/cksjava/aisense-cli/main/aisense"

# Installation directory (usually /usr/local/bin for global access)
INSTALL_DIR="/usr/local/bin"

# Check if the user has write permission to the installation directory
if [ ! -w "$INSTALL_DIR" ]; then
  echo "You don't have permission to write to $INSTALL_DIR. Try running the script with sudo."
  exit 1
fi

# Create a temporary file for the download
TMP_FILE="/tmp/aisense_latest"
TIMESTAMP=$(date +%s)  # Generate a timestamp to avoid caching

# Download the latest version of the aisense CLI script with a timestamp to bypass caching
echo "Downloading aisense CLI..."
curl -L "$AISENSE_URL?timestamp=$TIMESTAMP" -o "$TMP_FILE"

# Check if the download was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to download the aisense CLI."
    exit 1
fi

# Move the script to the installation directory
echo "Installing aisense CLI to $INSTALL_DIR..."
sudo mv "$TMP_FILE" "$INSTALL_DIR/aisense"

# Make the script executable
sudo chmod +x "$INSTALL_DIR/aisense"

# Verify installation
if command -v aisense > /dev/null; then
  echo "aisense CLI has been installed successfully!"
  echo "You can now use the 'aisense' command."
else
  echo "Installation failed. Please check your installation directory and permissions."
  exit 1
fi
