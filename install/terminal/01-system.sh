#! /bin/bash

PACKAGES=(
    "unzip"
    "psmisc"
    "pipx"
    "build-essential"
    
)

echo "Installing system packages"
for package in "${PACKAGES[@]}"
do
   sudo apt install -y "$package"
done
