export PATH=$PATH:$HOME/bin:${HOME}/.local/bin

if [ -f "${HOME}/dotfiles/bin/dotfiles" ]; then
    export PATH=$PATH:$HOME/dotfiles/bin
fi