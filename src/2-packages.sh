#!/bin/bash

# Package list - yay
PKGS=(
'nvm' # Node.js version manager
'firefox'
'github-desktop-bin' # Github GUI Desktop
'google-chrome'
'meld' # Compare files and directories
'slack-desktop' # Slack Desktop (Beta) for Linux
'timeshift' # Linux backup tool, uses rsync
'spotify' # Music streaming service
'postman-bin' # Postman for making API calls
)

for PKG in "${PKGS[@]}"; do
    yay -S --needed --noconfirm $PKG
done

# Activate nvm command
source /usr/share/nvm/init-nvm.sh

# Install both latest stable and LTS Node.js versions
nvm install node
nvm install --lts

# Add init-nvm.sh to shell startup
grep init-nvm ~/.zshrc >/dev/null && echo "init-nvm already configured, skipping" || {
  echo "Adding init-nvm to .zshrc"
  echo 'source /usr/share/nvm/init-nvm.sh' >> ~/.zshrc
}