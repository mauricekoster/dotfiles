#!/bin/bash

# Exit immediately if a command exits with a non-zero status
set -e

if ! has curl; then
    sudo apt install -y curl
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

if [ ! -d $HOME/.config ]; then
    mkdir $HOME/.config
fi

if [ ! -d $HOME/.local/bin ]; then
    mkdir -p $HOME/.local/bin
fi

if [ ! -d $HOME/bin ]; then
    mkdir -p $HOME/bin
fi

if [ ! -d $HOME/.fonts ]; then
    mkdir $HOME/.fonts
fi

if [ ! -d $HOME/.icons ]; then
    mkdir $HOME/.icons
fi

if [ ! -d $HOME/Pictures ]; then
    mkdir -p $HOME/Pictures
fi

if [ ! -d $HOME/Desktop ]; then
    mkdir -p $HOME/Desktop
fi

if [ ! -d $HOME/Documents ]; then
    mkdir -p $HOME/Documents
fi

if [ ! -d $HOME/Downloads ]; then
    mkdir -p $HOME/Downloads
fi


if [ ! -d $HOME/Music ]; then
    mkdir -p $HOME/Music
fi


if [ ! -d $HOME/Photos ]; then
    mkdir -p $HOME/Photos
fi


if [ ! -d $HOME/Projects ]; then
    mkdir -p $HOME/Projects
fi

if [ ! -d $HOME/Public ]; then
    mkdir -p $HOME/Public
fi

if [ ! -d $HOME/Share ]; then
    mkdir -p $HOME/Share
fi

if [ ! -d $HOME/Templates ]; then
    mkdir -p $HOME/Templates
fi

if [ ! -d $HOME/TV ]; then
    mkdir -p $HOME/TV
fi

if [ ! -d $HOME/Videos ]; then
    mkdir -p $HOME/Videos
fi
