let g:python_host_prog = "/Users/" . $USER . "/.venv/neovim2/bin/python"
let g:python3_host_prog = "/Users/" . $USER . "/.venv/neovim3/bin/python"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Plugins
call plug#begin('~/.vim/plugged')
    Plug 'tpope/vim-rhubarb'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-dispatch'
    Plug 'tpope/vim-unimpaired'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-vinegar'
    Plug 'tpope/vim-sensible'
    Plug 'tpope/vim-abolish'
    Plug 'tpope/vim-commentary'
    Plug 'tommcdo/vim-fugitive-blame-ext'
    Plug 'morhetz/gruvbox'
    Plug 'justinmk/molokai'
    Plug 'joshdick/onedark.vim'
    Plug 'KeitaNakamura/neodark.vim'
    Plug 'rakr/vim-one'
    Plug 'BrainDeath0/Hypsteria'
    Plug 'vim-scripts/Gummybears'
    Plug 'haishanh/night-owl.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'sheerun/vim-polyglot'
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    Plug 'w0rp/ale'
    Plug 'chrisbra/csv.vim'
    Plug 'reinh/vim-makegreen'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" Appearance
set background=dark
colorscheme gruvbox
" let g:airline_theme='gruvbox'
set relativenumber
set number
set showtabline=2
set noshowmode


" Behaviour
set inccommand=nosplit
set expandtab
set tabstop=4
set shiftwidth=4
set smartindent
set mouse=nv
set cursorcolumn
set cursorline
set hidden
set clipboard=unnamedplus
set grepprg=ag\ --nogroup\ --nocolor
set completeopt=longest,menuone

" let <Enter> accpet a match in completion menu
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" Map F1 to Esc in insert and allow it to quit help
inoremap <F1> <Esc>
noremap <F1> :call MapF1()<CR>
function! MapF1()
  if &buftype == "help"
    exec 'quit'
  else
    exec 'help'
  endif
endfunction

function! FormatPythonDictAsJson() range
  execute a:firstline . "," . a:lastline . "s/'/\"/g"
  execute a:firstline . "," . a:lastline . 's/None/"None"/g'
  execute a:firstline . "," . a:lastline . 's/True/true/g'
  execute a:firstline . "," . a:lastline . 's/False/false/g'
  execute a:firstline . "," . a:lastline . '!python -m json.tool'
endfunction
command! -range FormatPythonDictAsJson <line1>,<line2>call FormatPythonDictAsJson()


" Mappings
noremap <F2> :TagbarToggle<CR>
noremap <F4> :CocCommand<CR>
noremap <F5> :diffupdate<CR>

map sq :bd<CR>
map <Leader><Enter> :Buffers<CR>
nmap <Leader>d <Plug>(coc-definition)
noremap <Leader>c :Gdiff<CR>
noremap <Leader>g :GFiles<CR>
noremap <Leader>f :Files<CR>
noremap <Leader>t :Tags<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>o <ESC>:only<CR>
noremap <Leader>m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
xmap <Leader>l <Plug>(coc-format-selected)
nmap <Leader>l :call CocAction('format')<CR>
noremap <Leader>e :Explore<CR>
noremap <Leader>s :Sexplore<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>:20wincmd_<CR>
" nmap <silent> <leader>d <Plug>DashSearch

nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" Netrw
let g:netrw_liststyle = 3

" Tagbar
let g:tagbar_zoomwidth = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1
