" vim: nowrap fdm=marker fenc=utf-8
set nocompatible

" Plugins ---------------------------------------------------- {{{
filetype off 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"
" " The following are examples of different formats supported.
" " Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-fugitive'
" " plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'

" " All of your Plugins must be added before the following line
call vundle#end()   

syntax on

filetype plugin indent on
" }}}

" Powerline -------------------------------------------------- {{{
if has("python3")
	python3 from powerline.vim import setup as powerline_setup
	python3 powerline_setup()
	python3 del powerline_setup
	set laststatus=2
	set t_Co=256
endif
" }}}

" Settings --------------------------------------------------- {{{
set nu
set ruler
set fileencoding=utf-8
set encoding=utf-8
set nobackup

set hls

set incsearch
set nobackup
set tabstop=4
set expandtab
set shiftwidth=4
set autoindent
set autowrite
colors desert

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

nmap <leader>n :tabnext<cr>

if has("autocmd")
    autocmd bufwritepost .vimrc source $MYVIMRC
    autocmd bufwritepost _vimrc source $MYVIMRC
    autocmd bufwritepost vimrc source $MYVIMRC
endif

" }}} 

" Folding ----------------------------------------------------------------- {{{

set foldlevelstart=0

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" "Focus" the current line.  Basically:
"
" 1. Close all folds.
" 2. Open just the folds containing the current line.
" 3. Move the line to a little bit (15 lines) above the center of the screen.
" 4. Pulse the cursor line.  My eyes are bad.
"
" This mapping wipes out the z mark, which I never use.
"
" I use :sus for the rare times I want to actually background Vim.
nnoremap <c-z> mzzMzvzz15<c-e>`z:Pulse<cr>

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitute(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '¦' . repeat(" ",fillcharcount) . foldedlinecount . '¦' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" }}}
