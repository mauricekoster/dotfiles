#! /usr/bin/bash

# Check if Script is Run as Root
if [[ $EUID -ne 0 ]]; then
	echo "You must be a root user to run this script, please run sudo ./install.sh" 2>&1
	exit 1
fi

username=$(id -u -n 1000)
builddir=$(pwd)

# Update packages list and update system
apt update
apt upgrade -y

# Install nala
apt install nala -y

# Making .config and Moving config files and background to Pictures
cd $builddir
mkdir -p /home/$username/.config
mkdir -p /home/$username/.fonts

# Installing Essential Programs
nala install -y build-essential libx11-dev libxft-dev libxinerama-dev

# Installing xorg Programs
nala install -y \
	xorg xserver-xorg xinit x11-xserver-utils libxkbcommon-dev libxkbcommon-x11-dev

nala install -y \
	pulseaudio pavucontrol \
	alsa-utils pulsemixer \
	blueman libnotify-bin

# Installing Python and Qtile dependancies
nala install -y \
	python3 python3-pip python3-venv python3-v-sim python-dbus-dev \
	libpangocairo-1.0-0 python3-xcffib python3-cairocffi

# neovim build essentials
nala install -y \
	ninja-build gettext cmake

# Pyenv
nala install -y libssl-dev zlib1g-dev \
	libbz2-dev libreadline-dev libsqlite3-dev \
	libncursesw5-dev xz-utils tk-dev libxml2-dev libxmlsec1-dev libffi-dev liblzma-dev

# Utilities
nala install -y \
	neofetch kitty stow unzip wget curl \
	fd-find \
	feh \
	nitrogen \
	picom \
	psmisc \
	thunar \
	lxappearance \
	lxpolkit \
	papirus-icon-theme \
	rofi \
	sxhkd \
	ranger \
	dex \
	dunst \
	pipx \
	flatpak \
	fzf \
	virt-manager

# Login manager
nala install -y lightdm


# Add flatpak repo
# flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Enable graphical login and change target from CLI to GUI
systemctl enable lightdm
systemctl set-default graphical.target

# -----------------------------------------------------------------------
echo "Done."
echo "Run ./install-user.sh as normal user"

# EOF
