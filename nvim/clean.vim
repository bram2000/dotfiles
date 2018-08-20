" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'morhetz/gruvbox'
    Plug 'tpope/vim-fugitive'
    Plug 'tommcdo/vim-fugitive-blame-ext'
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'srstevenson/vim-picker'
    " Plug 'vim-airline/vim-airline'
    " Plug 'vim-airline/vim-airline-themes'
    Plug 'itchyny/lightline.vim'
    Plug 'shinchu/lightline-gruvbox.vim'
    Plug 'tomtom/tcomment_vim'
    Plug 'airblade/vim-gitgutter'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
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
set mouse=a
set cursorcolumn
set cursorline


" Mappings
map bp :PickerBuffer<CR>
map sq :bd<CR>


" vim-picker
let g:picker_find_executable = 'rg'
let g:picker_find_flags = '--color never --files'


" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'
