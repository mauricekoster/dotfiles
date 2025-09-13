#! /bin/bash

if has fzf; then
    eval "$(fzf --bash)"
fi

# To use fzf in Vim, add the following line to your .vimrc:
#  set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf
