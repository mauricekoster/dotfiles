

# --- Steam -------------------------------------------------------------------
flatpak install -y flathub com.valvesoftware.Steam

# --- Lazygit -----------------------------------------------------------------
if [ ! -f "/usr/local/bin/lazygit" ]; then
	info Installeer Lazygit
	pushd ${DOWNLOAD_DIR}
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm lazygit.tar.gz
	popd
fi

# -- pyenv
if [ ! -d "~/.pyenv" ]; then
	info Pyenv installeren
	pushd ~
	curl -s -S -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | bash
	popd
fi


