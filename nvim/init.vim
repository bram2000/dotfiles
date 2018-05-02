let g:python_host_prog = "/Users/" . $USER . "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/" . $USER . "/.pyenv/versions/neovim3/bin/python"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
let $MYREALVIMRC="/Users/" . $USER . "/.vimrc"

set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source $MYREALVIMRC
