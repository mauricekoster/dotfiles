#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

if ! has curl; then
    sudo apt install curl
fi

if ! has brew; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

if ! has gum; then
    brew install gum
fi
