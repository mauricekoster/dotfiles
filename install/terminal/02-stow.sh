#! /bin/bash

STOW=(
    "starship"
    "tmux"
    "tmuxinator"
)

for package in "${STOW[@]}"
do
   mystow "$package"
done
