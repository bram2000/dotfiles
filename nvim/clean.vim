" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'cloudhead/neovim-fuzzy'
    Plug 'srstevenson/vim-picker'
    "Plug 'w0rp/ale'
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


" Mappings
map bp :PickerBuffer<CR>
map sq :bd<CR>


" vim-picker
let g:picker_find_executable = 'rg'
let g:picker_find_flags = '--color never --files'
