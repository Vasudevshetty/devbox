#!/bin/bash
set -e

echo "Updating packages..."
sudo apt update && sudo apt upgrade -y

echo "Installing Nginx..."
sudo apt install -y nginx
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Installing Docker..."
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

echo "Adding current user to docker group..."
sudo usermod -aG docker $USER

echo "Installing Docker Compose..."
sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo "Verifying installations..."
nginx -v
docker --version
docker-compose --version

echo "Done! Please logout and login again or run 'newgrp docker' to apply docker group changes."
