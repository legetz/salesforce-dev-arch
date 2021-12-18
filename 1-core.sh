#!/bin/bash

TMP_DIR="${HOME}/sfDevArchTemp"
rm -rf ${TMP_DIR}
mkdir ${TMP_DIR}

# Package list - pacman
PKGS=(
'base-devel'
'git'
'jre11-openjdk'
'yay'
)

for PKG in "${PKGS[@]}"; do
    sudo pacman -S --needed --noconfirm $PKG
done

# Install YAY
#command -v yay >/dev/null && echo "yay found, skipping install" || {
#  echo "Installing yay"
#  git clone "https://aur.archlinux.org/yay.git" ${TMP_DIR}/yay
#  cd ${TMP_DIR}/yay
#  makepkg -si --noconfirm
#}


# Set default java version
sudo archlinux-java set java-11-openjdk