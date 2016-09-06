"-------------- Vundle ------------------
set nocompatible " required by Vundle
filetype off     " required by Vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'tommcdo/vim-fugitive-blame-ext'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}
"
Plugin 'cypok/vim-sml'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Bram - Vundle
Plugin 'luochen1990/rainbow'
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

Plugin 'godlygeek/tabular'

" Markdown
" autocmd BufNewFile,BufReadPost *.md set filetype=markdown
" Plugin 'instant-markdown.vim'
" Plugin 'tpope/vim-markdown'
" let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']

Plugin 'Syntastic'

Plugin 'dan-t/vim-hsimport'

" Bram - Vundle - VimClojure
Plugin 'VimClojure'
" Automatically determine indenting using fuzzy matching. e.g. the a line
" starting "(with-"
" " will be indented two spaces.
let vimclojure#FuzzyIndent=1
"
" " Highlight built-in functions from clojure.core and friends
let vimclojure#HighlightBuiltins=1
"
" " Highlight functions from contrib
let vimclojure#HighlightContrib=1
"
" " As new symbols are identified using VimClojure's dynamic features,
" automatically
" " highlight them.
let vimclojure#DynamicHighlighting=1
"
" " Color parens so they're easier to match visually
let vimclojure#ParenRainbow=1

"Plugin 'ascenator/L9', {'name': 'newL9'}

Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required

"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"-------------- \Vundle ------------------

syntax on
set autoindent
set smartindent
set expandtab
set ts=4
set backspace=2
set ruler
set relativenumber
set clipboard=unnamed

au BufRead,BufNewFile *.clj set filetype=clojure

" Insert ticks around word
map tt ysiw'
map `` ysiw`
map "" ysiw"
map TT ebi{'<ESC>ea'}<ESC>
