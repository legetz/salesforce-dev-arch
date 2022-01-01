#!/bin/bash

echo '----------------------------------'
echo 'Choose your IDE: '
echo '1 = VSCode'
echo '2 = IntelliJ IDEA'
echo 'Press any other key to skip IDE installation'
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