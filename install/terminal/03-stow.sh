#! /bin/bash

STOW=(
    "git"
    "starship"
    "tmux"
    "tmuxinator"
    "neovim"
    "photopatcher"
)

for package in "${STOW[@]}"
do
   mystow "$package"
done
