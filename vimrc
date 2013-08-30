" vim: nowrap fdm=marker fenc=utf-8
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Plugins ---------------------------------------------------- {{{
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#branch#empty_message = ''

execute pathogen#infect()
syntax on
filetype plugin indent on
" }}}

" MyDiff ----------------------------------------------------- {{{
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if &sh =~ '\<cmd'
    silent execute '!""C:\Program Files\Vim\vim74\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . '"'
  else
    silent execute '!C:\Program" Files\Vim\vim74\diff" ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  endif
endfunction
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
ab #! #! /usr/bin/perl
ab #c ######################################################################
set autoindent
set autowrite
colors desert

let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

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
