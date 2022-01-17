#!/usr/bin/env bash

set -o errexit
set -o nounset
set -o pipefail

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

# Configure handy aliases and helper functions
bash $SCRIPT_DIR/src/5-aliases.sh

rm -rf ${TMP_DIR}

echo -e "\nAll ready for coding once you open new terminal session."
echo "May the force be with you!"