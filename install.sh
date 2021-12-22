#!/bin/bash

SCRIPT_DIR="$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

# Make temporary dir for downloads
TMP_DIR="${SCRIPT_DIR}/tmp"
rm -rf ${TMP_DIR}
mkdir ${TMP_DIR}

# Install essential commands using pacman
bash $SCRIPT_DIR/src/1-core.sh

# Install packages using yay
bash $SCRIPT_DIR/src/2-packages.sh

# Install IDE (VSCode or Intellij Idea)
bash $SCRIPT_DIR/src/3-ide.sh

# Install SFDX CLI
bash $SCRIPT_DIR/src/4-sfdx.sh ${TMP_DIR}

rm -rf ${TMP_DIR}

echo -e "\nSUCCESS, all ready for coding. May the force be with you!"