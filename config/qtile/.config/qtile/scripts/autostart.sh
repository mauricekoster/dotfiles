#! /usr/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}

#start sxhkd to replace Qtile native key-bindings
run sxhkd -c ~/.config/sxhkd/sxhkdrc &

# Notification deamon
dunst &

# Compositor
picom --config $HOME/.config/picom/picom.conf --vsync &

# Policy kit
lxpolkit &

# Network Manager applet
nm-applet &

# Start XDG autostart .desktop files using dex. See also
# https://wiki.archlinux.org/index.php/XDG_Autostart
dex &


# Wallpapers
#feh --bg-fill ${HOME}/dotfiles/moria-wallpaper.jpg &

nitrogen --restore
