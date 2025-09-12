#! /usr/bin/env bash

set -e

ascii_art="
┳┳┓      •     ┳┓   ┏•┓   
┃┃┃┏┓┓┏┏┓┓┏┏┓  ┃┃┏┓╋╋┓┃┏┓┏
┛ ┗┗┻┗┻┛ ┗┗┗   ┻┛┗┛┗┛┗┗┗ ┛
                          
"

echo -e "${ascii_art}"

if [ ! -f /etc/os-release ]; then
    echo "Unable to determine distro"
    exit 1
fi

source /etc/os-release

echo "OS Distro: ${PRETTY_NAME}"
if [ ${ID} != "debian" ]; then
    echo "Distro not supported"
    exit 1
fi

# Update system
echo "Updating system"
sudo apt update && sudo apt upgrade

# Install git
sudo apt install -y git

# Use custom repo if specified, otherwise default to basecamp/omarchy
MKO_REPO="${MKO_REPO:-mauricekoster/dotfiles}"

echo -e "\nCloning MKo from: https://github.com/${MKO_REPO}.git"
rm -rf ~/.dotfiles/
git clone "https://github.com/${MKO_REPO}.git" ~/.dotfiles >/dev/null

# Start installation script
echo
echo "Installation starting..."
echo
source ~/.dotfiles/install.sh