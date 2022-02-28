#!/bin/bash

# Remove possible previous installation and config duplicates
rm -rf ${HOME}/.oh-my-zsh
rm ${HOME}/.zshrc.pre-oh-my-zsh*

# Download and install oh-my-zsh: https://ohmyz.sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Change shell for the next login
chsh -s $(which zsh)