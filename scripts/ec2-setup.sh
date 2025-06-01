#!/bin/bash
set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <username>"
  exit 1
fi

NEW_USER="$1"

# Prompt for password securely
read -s -p "Enter password for user $NEW_USER: " USER_PASS
echo
read -s -p "Confirm password: " USER_PASS_CONFIRM
echo

if [ "$USER_PASS" != "$USER_PASS_CONFIRM" ]; then
  echo "Passwords do not match. Exiting."
  exit 1
fi

echo "Creating new user: $NEW_USER"
if id -u $NEW_USER >/dev/null 2>&1; then
    echo "User $NEW_USER already exists, skipping creation."
else
    sudo adduser --gecos "" --disabled-password $NEW_USER
    echo "$NEW_USER:$USER_PASS" | sudo chpasswd
    sudo usermod -aG sudo $NEW_USER
    echo "User $NEW_USER created with the provided password and added to sudo group."
fi

echo "Copying SSH authorized_keys to $NEW_USER"
sudo mkdir -p /home/$NEW_USER/.ssh
sudo cp ~/.ssh/authorized_keys /home/$NEW_USER/.ssh/
sudo chown -R $NEW_USER:$NEW_USER /home/$NEW_USER/.ssh
sudo chmod 700 /home/$NEW_USER/.ssh
sudo chmod 600 /home/$NEW_USER/.ssh/authorized_keys

echo "Adding $NEW_USER to docker group"
sudo usermod -aG docker $NEW_USER

echo "Modifying sshd_config to allow only $NEW_USER SSH login"
SSHD_CONF="/etc/ssh/sshd_config"
ALLOW_LINE="AllowUsers $NEW_USER"

if grep -q "^AllowUsers" $SSHD_CONF; then
    sudo sed -i "s/^AllowUsers.*/$ALLOW_LINE/" $SSHD_CONF
else
    echo "$ALLOW_LINE" | sudo tee -a $SSHD_CONF
fi

echo "Restarting sshd service to apply changes"
sudo systemctl restart sshd

echo "Done! Logout and login as $NEW_USER, then run 'newgrp docker' to apply Docker permissions."
