#!/bin/bash

# Package list - pacman
PKGS=(
'base-devel' # Package group for building/compiling
'nodejs' # Node.Js, latest version
'jre11-openjdk' # OpenJDK Java 11 runtime
'yay' # Yet another yogurt. Pacman wrapper and AUR helper
'docker' # Docker container support
)

# Activate loop module for Docker
sudo tee /etc/modules-load.d/loop.conf <<< "loop"
sudo modprobe loop

# Update pacman package databases
sudo pacman -Sy --noconfirm

for PKG in "${PKGS[@]}"; do
    sudo pacman -S --needed --noconfirm $PKG
done

# Start and enable Docker service. This will start Docker daemon at every boot.
sudo systemctl start docker.service
sudo systemctl enable docker.service

# Add running user to docker group
sudo groupadd docker
sudo usermod -aG docker $USER

# Set default java version
sudo archlinux-java set java-11-openjdk