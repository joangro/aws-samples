#!/bin/bash
curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh > install.sh
sh ./install.sh
rm ./install.sh

cat <<EOF > ~/.vimrc
" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!

" YAML formatting
NeoBundle 'stephpy/vim-yaml'

" Node.js 
NeoBundle 'moll/vim-node'

" Golang
NeoBundle 'fatih/vim-go'

" Python
" NeoBundle 'python-mode/python-mode'
" NeoBundleLazy 'python-mode/python-mode', { 'on_ft': 'python' }


call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

set mouse=a
set history=500
set ruler
set autoread
au FocusGained,BufEnter * checktime

" Search
set ignorecase
set smartcase
set hlsearch
set incsearch
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" :W sudo saves the file
" (useful for handling the permission-denied error)
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!
EOF

