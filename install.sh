#!/bin/bash

# Install essential commands
bash 1-core.sh

# Package list - yay
PKGS=(
'firefox'
'github-desktop-bin' # Github Desktop sync
'google-chrome' # Google Chrome for best Salesforce compatibility
'slack'
'teams'
'timeshift'
'visual-studio-code-bin'
)

for PKG in "${PKGS[@]}"; do
    yay -S --needed --noconfirm $PKG
done

# Install extensions for VSCode
code --install-extension dbaeumer.vscode-eslint
code --install-extension salesforce.salesforcedx-vscode
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension chuckjonas.apex-pmd
code --install-extension esbenp.prettier-vscode

TMP_DIR="${HOME}/sfDevArchTemp"

echo "Installing latest stable SFDX CLI ..." && sleep 5
rm -rf ${HOME}/sfdx
cd ${TMP_DIR}
wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz
mkdir ${HOME}/sfdx
tar xJf sfdx-linux-x64.tar.xz -C ${HOME}/sfdx --strip-components 1
echo "PATH=~/sfdx/bin:$PATH" >> ~/.bashrc

rm -rf ${TMP_DIR}

echo -e "\nSuccess, all ready for the development. May the force be with you!"