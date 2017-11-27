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

" Bram - Vundle
Plugin 'luochen1990/rainbow'
Plugin 'fatih/vim-go'
let g:rainbow_active = 1 " 0 if you want to enable it later via :RainbowToggle

Plugin 'godlygeek/tabular'
Plugin 'Valloric/YouCompleteMe'

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

Plugin 'Solarized'
set rtp+=~/.vim/bundle/vim-colors-solarized

Plugin 'lrvick/Conque-Shell'

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

"-------------- \Vundle ------------------

au BufRead,BufNewFile *.clj set filetype=clojure

set autoindent
"set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set backspace=2
set ruler
set relativenumber
set clipboard=unnamed
set hlsearch
"
" Use solarized colorscheme
syntax enable
let g:solarized_termcolors=16
let g:solarized_style="dark"
set background=dark
colorscheme solarized

command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
        \ | wincmd p | diffthis

" Add powerline support (installed via pip)
source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" Insert ticks around word
map tt ysiw'
map `` ysiw`
map "" ysiw"
map TT ebi{'<ESC>ea'}<ESC>

" Some options for YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
