#!/bin/bash

# Activate loop module for Docker
sudo tee /etc/modules-load.d/loop.conf <<< "loop"
sudo modprobe loop

# Install Docker
sudo pacman -S --needed --noconfirm docker

# Start and enable Docker service. This will start Docker daemon at every boot.
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Add running user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER