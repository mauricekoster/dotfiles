#! /usr/bin/bash

# Check if Script is Run as non-Root
if [[ $EUID -eq 0 ]]; then
	echo "You must NOT be a root user to run this script, please run ./install-user.sh as yourself ;)" 2>&1
	exit 1
fi

has() {
  command -v "$1" 1>/dev/null 2>&1
}

# --- Qtile ------------------------------------------------------------------
if ! has qtile; then
	echo === Installeer qtile
	pipx install qtile
	pipx inject qtile qtile-extras
	echo "exec /home/$(whoami)/.local/bin/qtile start" >~/.xsession
fi

echo Please reboot