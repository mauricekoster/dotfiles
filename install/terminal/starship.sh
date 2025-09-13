#! /bin bash

if [ -f $HOME/.config/starship.toml ]; then
    rm -f $HOME/.config/starship.toml
fi
mystow starship