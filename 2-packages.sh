#!/bin/bash

# Package list - yay
PKGS=(
'nvm' # Node.js version manager
'firefox'
'github-desktop-bin' # Github GUI Desktop
'google-chrome'
'slack'
'teams'
'timeshift' # Linux backup tool, uses rsync
)

for PKG in "${PKGS[@]}"; do
    yay -S --needed --noconfirm $PKG
done

# Activate nvm command
source /usr/share/nvm/init-nvm.sh

# Add nvm init to shell startup
echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.bashrc