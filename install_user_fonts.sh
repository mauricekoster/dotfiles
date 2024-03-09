#! /bin/bash

username=$(id -u -n 1000)
builddir=$(pwd)



# Installing fonts
cd $builddir
sudo apt install fonts-font-awesome fonts-noto-color-emoji -y

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/JetBrainsMono.zip
unzip JetBrainsMono.zip -d /home/$username/.fonts
chown $username:$username /home/$username/.fonts/*

# Reloading Font
fc-cache -vf
# Removing zip Files
rm ./JetBrainsMono.zip

# Download Nordic Theme
cd /usr/share/themes/
git clone https://github.com/EliverLara/Nordic.git

# Install Nordzy cursor
cd $builddir
git clone https://github.com/alvatip/Nordzy-cursors
cd Nordzy-cursors
./install.sh
cd $builddir
rm -rf Nordzy-cursors
