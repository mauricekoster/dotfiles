#! /bin/bash

# Thorium browser
wget https://dl.thorium.rocks/debian/dists/stable/thorium.list
sudo mv thorium.list /etc/apt/sources.list.d/
sudo apt update
nala install -y thorium-browser
