#! /bin/bash

STOW=(
    "xdg"
    "gtk"
    "kitty"
    "qtile"
    "rofi"
    "picom"
    "sxhkd"
    "nitrogen"
)

for package in "${STOW[@]}"
do
   mystow "$package"
done
