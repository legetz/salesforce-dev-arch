#!/bin/bash

TMP_DIR="${HOME}/salesforce-dev-arch-tmp"
rm -rf ${TMP_DIR}
mkdir ${TMP_DIR}

# Install essential commands using pacman
bash 1-core.sh

# Install packages using yay
bash 2-packages.sh

# Install IDE (VSCode or Intellij Idea)
bash 3-ide.sh

echo "Installing latest stable SFDX"
rm -rf ${HOME}/sfdx
cd ${TMP_DIR}
wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz
mkdir ${HOME}/sfdx
tar xJf sfdx-linux-x64.tar.xz -C ${HOME}/sfdx --strip-components 1
# Add sfdx to PATH
grep "sfdx/bin" ~/.bashrc >/dev/null && echo "sfdx/bin already in PATH, skipping" || {
  echo "Adding sfdx/bin to PATH at .bashrc"
  echo "PATH=~/sfdx/bin:$PATH" >> ~/.bashrc
  source ~/.bashrc
}

rm -rf ${TMP_DIR}

echo -e "\nSUCCESS, all ready for coding. May the force be with you!"