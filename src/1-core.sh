#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Update pacman package databases
sudo pacman -Sy --noconfirm

# Install oh-my-zsh and change shell to ZSH
bash $SCRIPT_DIR/1-oh-my-zsh.sh

# Package list - pacman
PKGS=(
'base-devel' # Package group for building/compiling
'nodejs' # Node.Js, latest version
'jre11-openjdk' # OpenJDK Java 11 runtime
'yay' # Yet another yogurt. Pacman wrapper and AUR helper
'serverless' # Serverless framework for deployments to AWS/Azure/GCP
'terraform' # Terraform for deployments to AWS/Azure/GCP
'vlc' # VLC multimedia player
)

for PKG in "${PKGS[@]}"; do
    sudo pacman -S --needed --noconfirm $PKG
done

# Set default java version
sudo archlinux-java set java-11-openjdk

# Install Docker
bash $SCRIPT_DIR/1-docker.sh