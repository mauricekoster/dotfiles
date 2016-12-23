dotfiles
========

dotfiles for vim, bash etc

## Installing


### Linux

    git clone http://github.com/mauricekoster/dotfiles.git ~/.vim

    ln -s ~/.vim/vimrc ~/.vimrc

### Windows

    cd
    git clone http://github.com/mauricekoster/dotfiles.git

Create a $HOME\_vimrc with this content:

	set runtimepath=$HOME\dotfiles,$VIMRUNTIME
	source $HOME\dotfiles\vimrc

	nmap <leader>v :tabedit $HOME\dotfiles\vimrc<CR>

### Install Vundle

Set up Vundle:

$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim


### Updating modules

Inside a vim session in command mode:
    :PluginInstall

