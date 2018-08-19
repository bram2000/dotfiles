" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'cloudhead/neovim-fuzzy'
call plug#end()


" Appearance
set background=dark
colorscheme gruvbox
set relativenumber
set number


" Behaviour
set inccommand=nosplit
set expandtab
set tabstop=4
set shiftwidth=4
