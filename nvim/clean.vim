let g:python_host_prog = "/Users/" . $USER . "/.venv/neovim2/bin/python"
let g:python3_host_prog = "/Users/" . $USER . "/.venv/neovim3/bin/python"

let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" Some plugins don't play nicely with fish shell
set shell=bash\ -i

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
    Plug 'suan/vim-instant-markdown'
    Plug 'vim-airline/vim-airline'
    Plug 'airblade/vim-gitgutter'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'yuki-ycino/fzf-preview.vim'
    Plug 'bogado/file-line'
    Plug 'machakann/vim-highlightedyank'
    Plug 'sheerun/vim-polyglot'
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Plug 'w0rp/ale'
    Plug 'chrisbra/csv.vim'
    Plug 'reinh/vim-makegreen'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
    Plug 'darfink/vim-plist'
    Plug 'ryanoasis/vim-devicons'
call plug#end()


" Appearance
set background=dark
colorscheme gruvbox
let g:airline_theme='gruvbox'
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
set grepprg=rg\ --vimgrep
set completeopt=longest,menuone
set sessionoptions+=globals

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


function! IwhiteToggle()
    if &diffopt =~ 'iwhite'
        set diffopt-=iwhite
    else
        set diffopt+=iwhite
    endif
endfunction


" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Mappings
noremap <F2> :TagbarToggle<CR>
noremap <F4> :CocCommand<CR>
noremap <F5> :diffupdate<CR>

map sq :bd<CR>
map <Leader><Enter> :Buffers<CR>
nmap <silent> <Leader>d <Plug>(coc-definition)
nmap <silent> <Leader>r <Plug>(coc-references)
noremap <Leader>c :Gvdiff<CR>
noremap <Leader>g :FzfPreviewGitFiles<CR>
noremap <Leader>f :FzfPreviewProjectFiles<CR>
noremap <Leader>t :Tags<CR>
noremap <Leader>b :FzfPreviewBuffers<CR>
noremap <Leader>o <ESC>:only<CR>
noremap <Leader>m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
xmap <Leader>l <Plug>(coc-format-selected)
" noremap <Leader>l :ALEFix<CR>
nnoremap <Leader>l :Format<CR>
noremap <Leader>e :Explore<CR>
noremap <Leader>s :Sexplore<CR>
noremap <Leader>w :call IwhiteToggle()<CR>
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
let g:netrw_fastbrowse = 0
autocmd FileType netrw setl bufhidden=wipe

" Tagbar
let g:tagbar_zoomwidth = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

autocmd FileType json syntax match Comment +\/\/.\+$+

" Ultisnips
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger='<tab>'

" shortcut to go to next position
let g:UltiSnipsJumpForwardTrigger='<c-j>'

" shortcut to go to previous position
let g:UltiSnipsJumpBackwardTrigger='<c-k>'

" Markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1
let g:instant_markdown_autostart = 0

" FZF preview options
let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"'
let g:fzf_preview_command = 'ccat --color=always {-1}'
let g:fzf_preview_filelist_postprocess_command = 'gxargs -d "\n" exa --color=always'
let g:fzf_preview_use_dev_icons = 1

" Move to last cursor position on file open (:help restore-cursor)
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif
