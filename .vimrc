call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tommcdo/vim-fugitive-blame-ext'
Plug 'tpope/vim-rhubarb'
Plug 'git://git.wincent.com/command-t.git'
Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
Plug 'cypok/vim-sml'
Plug 'luochen1990/rainbow'
Plug 'fatih/vim-go'
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

Plug 'godlygeek/tabular'
Plug 'Valloric/YouCompleteMe', { 'do' : '~/.vim/plugged/YouCompleteMe/install.py --gocode-completer' }
Plug 'python-mode/python-mode'
Plug 'w0rp/ale'
Plug 'dan-t/vim-hsimport'
"Plug 'ascenator/L9', {'name': 'newL9'}
Plug 'tpope/vim-surround'

Plug 'lrvick/Conque-Shell'

Plug 'kien/ctrlp.vim'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" JS & Angular stuff
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'burnettk/vim-angular'

Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree'

Plug 'roman/golden-ratio'

" Plug 'Solarized'
" set rtp+=~/.vim/bundle/vim-colors-solarized
" Plug 'micha/vim-colors-solarized'
Plug 'morhetz/gruvbox'

" All of your Plugs must be added before the following line
call plug#end() "required


au BufRead,BufNewFile *.clj set filetype=clojure

set autoindent
"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set ruler
set relativenumber
set number
set clipboard=unnamed
set hlsearch
"
" Use solarized colorscheme
"let g:solarized_termcolors=16
"let g:solarized_style="dark"
set background=dark
"colorscheme solarized
colorscheme gruvbox
syntax enable

command! DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis

""" Add powerline support (installed via pip)
""source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
"let g:pymode_python = 'python3'
"source /Users/jbramley/Library/Python/3.6/lib/python/site-packages/powerline/bindings/vim/plugin/powerline.vim
"py3 from powerline.vim import setup as powerline_setup
"py3 powerline_setup()
"py3 del powerline_setup
"
" Airline (powerline replacement) config
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline_theme = 'solarized'

" Insert ticks around word
map tt ysiw'
map `` ysiw`
map "" ysiw"
map TT ebi{'<ESC>ea'}<ESC>

" Some options for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

" }}}
" Python-Mode {{{

"let pymode = 0

" Common Options {{{
" pymode-common
let g:pymode_trim_whitespace = 1

" pymode-indent
let g:pymode_indent = 1

" pymode-folding
let g:pymode_folding = 0

" pymode-documentation
let g:pymode_doc = 1
let g:pymode_doc_bind = '<F2>'
let g:pydoc = 'pydoc'

" pymode-virtualenv
let g:pymode_virtualenv = 0

" pymode-run
let g:pymode_run = 0

" pymode-breakpoints
let g:pymode_breakpoint = 0
" }}}

" Lint Options {{{
let g:pymode_lint = 0
let g:pymode_lint_checkers = ['pyflakes', 'pep8', 'pep257']

" Set <Leader> key to ;
let mapleader = ";"

nnoremap <leader>L :PymodeLint
" }}}

" Rope Options {{{
let g:pymode_rope = 0

" pymode-completion
let g:pymode_rope_completion = 0
let g:pymode_rope_lookup_project = 1
" }}}

" Syntax Options {{{
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_builtin_objs = 1
let g:pymode_syntax_print_as_function = 0
let g:pymode_syntax_space_errors = 0
" }}}

" Python-mode
"let g:pymode = 0
"let g:pymode_lint = 0
"let g:pymode_rope = 0
"let g:pymode_rope_completion = 0
"let g:pymode_rope_lookup_project = 0
"let g:pymode_virtualenv = 0
let g:pymode_rope_regenerate_on_write = 1

let g:ale_linters = {'javascript': ['eslint'],
\                    'python': ['pylint']}
let g:ale_fixers = {'javascript': ['eslint'],
\                   'python': ['yapf']}

autocmd BufReadPre *.js let b:javascript_lib_use_angularjs = 1
autocmd FileType javascript set tabstop=2|set shiftwidth=2|set expandtab

" Reload .vimrc automatically when saved
if has ('autocmd') " Remain compatible with earlier versions
 augroup vimrc     " Source vim configuration upon save
    autocmd! BufWritePost $MYVIMRC source % | echom "Reloaded " . $MYVIMRC | redraw
    if !empty($MYGVIMRC)
        autocmd! BufWritePost $MYGVIMRC if has('gui_running') | so % | echom "Reloaded " . $MYGVIMRC | endif | redraw
    endif
    if !empty($MYREALVIMRC)
        autocmd! BufWritePost $MYREALVIMRC source % | echom "Reloaded " . $MYREALVIMRC | redraw
    endif
  augroup END
endif " has autocmd

" Toggle paste mode and write helpful message
function! TogglePaste()
    if &paste | set nopaste | echom "Paste mode disabled"
    else      | set paste   | echom "Paste mode enabled"
    endif
endfunction


"   <F1> is mapped to help
"   <F2> is mapped to pydoc
map <F3> :call TogglePaste()<CR>
map <F4> :ALEFix<CR>
map <F5> :set invnumber invrelativenumber<CR>
map <F6> :NERDTreeToggle<CR>
map <F7> :tabp<CR>
imap <F7> <Esc>:tabp<CR>
map <F8> :tabn<CR>
imap <F8> <Esc>:tabn<CR>
map <F9> :bp<CR>
imap <F9> <Esc>:bp<CR>
map <F10> :bn<CR>
imap <F10> <Esc>:bn<CR>

" Move to the previous buffer with "gp"
nnoremap gp :bp<CR>
" Move to the next buffer with "gn"
nnoremap gn :bn<CR>
" List all possible buffers with "gl"
nnoremap gl :ls<CR>
" List all possible buffers with "gb" and accept a new buffer argument [1]
nnoremap gb :ls<CR>:b

" Close buffer without closing window
nmap <leader>c :ene<CR>:bw #<CR>

" Open files in vertical horizontal split
nnoremap <Leader>s :call fzf#run({
    \ 'right': winwidth('.') / 2,
    \ 'sink':  'botright split' })<CR>

" Dash integration for objc and nimrod.
command! DashPy silent !open -g dash://python3:"<cword>"
command! DashDef silent !open -g dash://def:"<cword>"

set laststatus=2
set cursorline
set cursorcolumn
set hidden
