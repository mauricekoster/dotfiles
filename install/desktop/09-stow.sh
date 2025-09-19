#! /bin/bash

STOW=(
    "xdg"
    "gtk"
    "kitty"
    "qtile"
    "rofi"
    "picom"
    "sxhkd"
)

for package in "${STOW[@]}"
do
   mystow "$package"
done
