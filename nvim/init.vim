let g:python_host_prog = '/Users/bram/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/bram/.pyenv/versions/neovim3/bin/python'

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
