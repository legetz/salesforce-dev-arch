#!/bin/bash

TMP_DIR="${HOME}/salesforce-dev-arch-tmp"
rm -rf ${TMP_DIR}
mkdir ${TMP_DIR}

# Install essential commands
bash 1-core.sh

# Package list - yay
PKGS=(
'firefox'
'github-desktop-bin' # Github GUI Desktop
'google-chrome'
'slack'
'teams'
'timeshift' # Linux backup tool, uses rsync
'visual-studio-code-bin'
)

for PKG in "${PKGS[@]}"; do
    yay -S --needed --noconfirm $PKG
done

echo "Installing VSCode extensions..." && sleep 3

# Install extensions for VSCode
code --install-extension dbaeumer.vscode-eslint
code --install-extension salesforce.salesforcedx-vscode
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension chuckjonas.apex-pmd
code --install-extension esbenp.prettier-vscode

command -v sfdx >/dev/null && echo "SFDX found, skipping install" || {
  echo "Installing latest stable SFDX"
  rm -rf ${HOME}/sfdx
  cd ${TMP_DIR}
  wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz
  mkdir ${HOME}/sfdx
  tar xJf sfdx-linux-x64.tar.xz -C ${HOME}/sfdx --strip-components 1
  echo "PATH=~/sfdx/bin:$PATH" >> ~/.bashrc
}

rm -rf ${TMP_DIR}

echo -e "\nSuccess, all ready for the development. May the force be with you!"