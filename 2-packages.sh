#!/bin/bash

# Package list - yay
PKGS=(
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