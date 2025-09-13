#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

if ! has curl; then
    sudo apt install curl
fi

if ! has brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
# Set Brew environment variables for install phase
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if ! has gum; then
    echo "Installing gum"
    brew install gum
fi

if ! has stow; then
    echo "Install stow"
    brew install stow
fi