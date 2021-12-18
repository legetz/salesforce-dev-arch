#!/bin/bash

# Package list - pacman
PKGS=(
'base-devel' # Package group for building/compiling
'git'
'nodejs' # Node.Js, latest version
'jre11-openjdk' # OpenJDK Java 11 runtime
'yay' # Yet another yogurt. Pacman wrapper and AUR helper
)

# Update pacman package databases
sudo pacman -Sy --noconfirm

for PKG in "${PKGS[@]}"; do
    sudo pacman -S --needed --noconfirm $PKG
done

# Set default java version
sudo archlinux-java set java-11-openjdk