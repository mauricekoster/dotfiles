#! /bin/bash

# Nordic
if [ ! -d /usr/share/themes/Nordic ]; then
    sudo git clone https://github.com/EliverLara/Nordic.git /usr/share/themes/Nordic 2>&1 /dev/null
fi

# Icons
if [ ! -d $HOME/.local/share/icons/Nordzy ]; then
    git clone https://github.com/alvatip/Nordzy-icon $HOME/Nordzy-icon 2>&1 /dev/null
    mypushd $HOME/Nordzy-icon
    ./install.sh 
    mypopd
    rm -rf "$HOME/Nordzy-icon"
fi 

# Cursors
if [ ! -d $HOME/.icons/Nordzy-cursors ]; then
    git clone https://github.com/alvatip/Nordzy-cursors $HOME/Nordzy-cursors 2>&1 /dev/null
    mypushd $HOME/Nordzy-cursors
    ./install.sh 
    mypopd
    rm -rf "$HOME/Nordzy-cursors"
fi 