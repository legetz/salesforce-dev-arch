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