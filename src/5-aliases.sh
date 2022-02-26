#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Add aliases.sh to shell startup
grep "$HOME/aliases.sh" ~/.zshrc >/dev/null && echo "aliases.sh already configured, skipping" || {
  # Copy aliases into home folder
  cp $SCRIPT_DIR/aliases.sh $HOME

  echo "Adding aliases.sh to .zshrc"
  echo "source $HOME/aliases.sh" >> ~/.zshrc
}