#! /bin/bash

if [ ! -f $HOME/.fonts/JetBrainsMonoNerdFont-Bold.ttf ]; then

    wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/JetBrainsMono.zip
    unzip -q -o JetBrainsMono.zip -d $HOME/.fonts

    fc-cache -fv
fi