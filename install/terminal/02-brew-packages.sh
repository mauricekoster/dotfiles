#! /bin/bash

BREWPACKAGES=(
    "btop"
    "tmux"
    "tmuxinator"
    "eza"
    "fzf"
    "ripgrep"
    "fd"
    "bat"
    "zoxide"
    "neovim"
    "starship"
    "sqlite"
    "ranger"
    "lazygit"
    "fastfetch"
    "pyenv"
)

for package in "${BREWPACKAGES[@]}"
do
   brew install "$package"
done
