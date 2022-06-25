set nocompatible
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set number
set noswapfile
set backupdir=$HOME/.cache/nvim/
set clipboard=unnamedplus

call plug#begin()
Plug 'Mofiqul/dracula.nvim'
call plug#end()

colorscheme dracula
