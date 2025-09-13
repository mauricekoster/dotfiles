#! /bin/bash

if [ -x $HOME/.dotfiles ]; then
    export MKO_PATH=$HOME/.dotfiles
elif [ -x $HOME/dotfiles ]; then
    export MKO_PATH=$HOME/dotfiles
fi

export PATH=$PATH:$MKO_PATH/bin

echo "MKO_PATH: ${MKO_PATH}"