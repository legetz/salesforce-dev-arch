#!/bin/bash

echo "Installing VSCode"
yay -S --needed --noconfirm visual-studio-code-bin

echo "Installing VSCode extensions"
code --install-extension --force dbaeumer.vscode-eslint
code --install-extension --force salesforce.salesforcedx-vscode
code --install-extension --force eamodio.gitlens
code --install-extension --force mhutchie.git-graph
code --install-extension --force chuckjonas.apex-pmd
code --install-extension --force esbenp.prettier-vscode