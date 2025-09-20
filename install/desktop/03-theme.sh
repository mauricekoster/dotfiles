#! /bin/bash

# Nordic
if [ ! -d /usr/share/themes/Nordic ]; then
    echo "Installing Nordic"
    sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic 2>&1 >/dev/null
fi

# Icons
if [ ! -d $HOME/.local/share/icons/Nordzy ]; then
    echo "Installing Nordzy-icon"
    git clone https://github.com/alvatip/Nordzy-icon $HOME/Nordzy-icon 2>&1 >/dev/null
    mypushd $HOME/Nordzy-icon
    ./install.sh 
    mypopd
    rm -rf "$HOME/Nordzy-icon"
fi 

# Cursors
if [ ! -d $HOME/.local/share/icons/Nordzy-cursors ]; then
    echo "Installing Nordzy-cursors"
    git clone https://github.com/alvatip/Nordzy-cursors $HOME/Nordzy-cursors 2>&1 >/dev/null
    mypushd $HOME/Nordzy-cursors
    ./install.sh 
    mypopd
    rm -rf "$HOME/Nordzy-cursors"
fi 