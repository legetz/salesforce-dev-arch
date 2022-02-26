#!/bin/bash

# Remove possible previous installation
rm -rf ${HOME}/.oh-my-zsh

# Download and install oh-my-zsh: https://ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended