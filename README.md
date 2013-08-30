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
	source dotfiles\vimrc

	nmap <leader>v :tabedit $HOME\dotfiles\vimrc<CR>

### Updating modules

Inside ~/.vim or $HOME\\dotfiles:

    git submodule foreach git pull
