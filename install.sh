#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

# Give people a chance to retry running the installation
trap 'echo "MKo installation failed! You can retry by running: source ~/.dotfiles/install.sh"' ERR

# Check if Script is Run as Root
if [[ $EUID -eq 0 ]]; then
	echo "You must be a normal user to run this script, please run ~/.dotfiles/install.sh" 2>&1
	exit 1
fi

MKO_PATH=${MKO_PATH:-${HOME}/.dotfiles}
echo "MKO_PATH: ${MKO_PATH}"
source ${MKO_PATH}/functions.sh

echo ""
echo "Install terminal applications"
source ${MKO_PATH}/install/terminal.sh