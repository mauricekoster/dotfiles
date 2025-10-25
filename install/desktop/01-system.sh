#! /bin/bash

PACKAGES=(
    "qtile"
    "lightdm"
    "pulseaudio"
    "pavucontrol"
    "alsa-utils"
    "pulsemixer"
    "blueman"
    "libnotify-bin"

    "libssl-dev"
    "zlib1g-dev"
	"libbz2-dev"
    "libreadline-dev"
    "libsqlite3-dev"
	"libncursesw5-dev"
    "xz-utils"
    "tk-dev"
    "libxml2-dev"
    "libxmlsec1-dev"
    "libffi-dev"
    "liblzma-dev"
    "libx11-dev"
    "libxft-dev"
    "libxinerama-dev"

    "thunar"
	"lxappearance"
	"lxpolkit"
	"dex"
	"dunst"

    "kitty"
    "rofi"
    "picom"
    "feh"
    "flatpak"
    "virt-manager"
    "jq"
    "xsel"
    "net-tools"
    "sxhkd"
    "nitrogen"

    "fonts-glyphicons-halflings"
    "fonts-noto-color-emoji"
    "fonts-font-awesome"
)

echo "Installing system packages"
for package in "${PACKAGES[@]}"
do
   sudo apt install -y "$package"
done
