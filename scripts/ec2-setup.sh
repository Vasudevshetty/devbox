#!/bin/bash

# Exit immediately if a command exits with a non-zero status.
set -e

# Variables
NEW_USERNAME="devuser" # Feel free to change this username

# Create a new user
echo "Creating user $NEW_USERNAME..."
if id "$NEW_USERNAME" &>/dev/null; then
    echo "User $NEW_USERNAME already exists."
else
    sudo useradd -m -s /bin/bash "$NEW_USERNAME"
    # Set up password for the new user - uncomment and set a password or handle manually
    # echo "$NEW_USERNAME:yourpassword" | sudo chpasswd
    # Add user to sudo group if needed
    # sudo usermod -aG sudo "$NEW_USERNAME"
    echo "User $NEW_USERNAME created. Please set a password for this user manually if not scripted."
fi

# Update package list and install packages
echo "Updating package list..."
sudo apt-get update -y

echo "Installing nginx, docker, git..."
sudo apt-get install -y nginx docker.io git

# Setup bootstrap
# Assuming bootstrap.sh is in the same directory as ec2-setup.sh
SCRIPT_DIR=$(dirname "$0")
echo "Running bootstrap script..."
if [ -f "$SCRIPT_DIR/bootstrap.sh" ]; then
    bash "$SCRIPT_DIR/bootstrap.sh"
else
    echo "bootstrap.sh not found in $SCRIPT_DIR"
    exit 1
fi

# Modify sshd_config
echo "Modifying sshd_config..."
# Ensure PasswordAuthentication is enabled
sudo sed -i 's/^#?PasswordAuthentication .*/PasswordAuthentication yes/' /etc/ssh/sshd_config
echo "PasswordAuthentication set to yes in /etc/ssh/sshd_config"

# Ensure PubkeyAuthentication is enabled (usually default)
sudo sed -i 's/^#?PubkeyAuthentication .*/PubkeyAuthentication yes/' /etc/ssh/sshd_config
echo "PubkeyAuthentication set to yes in /etc/ssh/sshd_config"

# Restart SSH service to apply changes
echo "Restarting SSH service..."
if command -v systemctl &>/dev/null; then
    sudo systemctl restart sshd
else
    sudo service ssh restart
fi

echo "Setup complete."
echo "Remember to set a password for $NEW_USERNAME if you haven't."
echo "You might also want to add $NEW_USERNAME to the sudo group: sudo usermod -aG sudo $NEW_USERNAME"
