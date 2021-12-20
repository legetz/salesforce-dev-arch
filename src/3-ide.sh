#!/bin/bash

echo '----------------------------------'
echo 'Choose your IDE: 1=VSCode, 2=IntelliJ IDEA'
read -p 'Selection: ' CHOICE
echo '----------------------------------'

if [ $CHOICE == 1 ] 
then echo "Installing VSCode"
yay -S --needed --noconfirm visual-studio-code-bin

echo "Installing VSCode extensions"
code --install-extension --force dbaeumer.vscode-eslint
code --install-extension --force salesforce.salesforcedx-vscode
code --install-extension --force eamodio.gitlens
code --install-extension --force mhutchie.git-graph
code --install-extension --force chuckjonas.apex-pmd
code --install-extension --force esbenp.prettier-vscode
elif [ $CHOICE == 2 ] 
then echo 'Installing IntelliJ IDEA'
yay -S --needed --noconfirm intellij-idea-community-edition
fi