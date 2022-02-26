#!/bin/bash

# Set download directory path using given parameter or user home "Downloads" by default
DL_DIR="${1:-${HOME}/Downloads}"

echo "Installing latest stable SFDX"
rm -rf ${HOME}/sfdx
cd ${DL_DIR}
wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz
mkdir ${HOME}/sfdx
tar xJf sfdx-linux-x64.tar.xz -C ${HOME}/sfdx --strip-components 1
# Add sfdx to PATH
grep "sfdx/bin" ${HOME}/.zshrc >/dev/null || {
  echo "Adding sfdx to PATH at $HOME/.zshrc"
  echo "PATH=$HOME/sfdx/bin:$PATH" >> ~/.zshrc
}
rm sfdx-linux-x64.tar.xz

echo "Installed latest stable SFDX"