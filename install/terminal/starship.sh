#! /bin bash

if ! has starship; then 
    brew install starship
    if [ -f $HOME/.config/starship.toml ]; then
        rm -f $HOME/.config/starship.toml
    fi
    mystow starship
fi