let g:python_host_prog = "/Users/" . $USER . "/.pyenv/versions/neovim2/bin/python"
let g:python3_host_prog = "/Users/" . $USER . "/.pyenv/versions/neovim3/bin/python"

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
    " Plug 'justinmk/molokai'
    " Plug 'joshdick/onedark.vim'
    " Plug 'KeitaNakamura/neodark.vim'
    " Plug 'rakr/vim-one'
    " Plug 'BrainDeath0/Hypsteria'
    " Plug 'vim-scripts/Gummybears'
    " Plug 'haishanh/night-owl.vim'
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    " Plug 'vim-airline/vim-airline'
    Plug 'itchyny/lightline.vim'
    Plug 'airblade/vim-gitgutter'
    Plug '/usr/local/opt/fzf'
    Plug 'junegunn/fzf.vim'
    Plug 'machakann/vim-highlightedyank'
    Plug 'sheerun/vim-polyglot'
    Plug 'majutsushi/tagbar'
    Plug 'Yggdroot/indentLine'
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    " Plug 'w0rp/ale'
    Plug 'chrisbra/csv.vim'
    Plug 'reinh/vim-makegreen'
    Plug 'rizzatti/dash.vim'
    " Plug 'ervandew/supertab'
    Plug 'roxma/nvim-yarp'
    " Plug 'ncm2/ncm2-bufword'
    " Plug 'ncm2/ncm2-path'
    " Plug 'ncm2/ncm2-jedi'
    " Plug 'ncm2/ncm2-ultisnips'
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
    Plug 'powerman/vim-plugin-AnsiEsc',
    Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}},
call plug#end()


" Appearance
set background=dark
colorscheme gruvbox
" let g:airline_theme='one'
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
" set completeopt=longest,menuone

" let g:ale_lint_on_insert_leave = 1

autocmd FileType python setlocal omnifunc=python3complete#Complete

" let <Enter> accpet a match in completion menu
inoremap <expr> <Esc>      pumvisible() ? "\<C-e>" : "\<Esc>"
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"


" inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

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
noremap <F5> :diffupdate<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

map sq :bd<CR>
map <Leader><Enter> :Buffers<CR>
noremap <Leader>g :GFiles<CR>
noremap <Leader>f :Files<CR>
noremap <Leader>t :Tags<CR>
noremap <Leader>b :Buffers<CR>
noremap <Leader>o <ESC>:only<CR>
noremap <Leader>m <ESC>:exec &mouse!=""? "set mouse=" : "set mouse=nv"<CR>
noremap <Leader>l :call CocAction('format')<CR>
noremap <Leader>d :call LanguageClient#textDocument_definition()<CR>
noremap <Leader>e :Explore<CR>
noremap <Leader>s :Sexplore<CR>
noremap <Leader>v :Vexplore<CR>
" noremap <Leader>h :ALEHover<CR>
" noremap <Leader>r :ALEFindReferences<CR>
noremap <Leader>c :Gvdiff<CR>
nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>gs :Gstatus<CR>:20wincmd_<CR>
" nmap <silent> <leader>d <Plug>DashSearch

" Navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

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
autocmd FileType netrw nnoremap <buffer> q :bw<CR>
autocmd FileType netrw noremap <buffer> <Space> :Ntree<CR>
" Per default, netrw leaves unmodified buffers open. This autocommand
" deletes netrw's buffer once it's hidden (using ':q', for example)
autocmd FileType netrw setl bufhidden=delete

" parameter expansion for selected entry via Enter
" inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" let g:UltiSnipsExpandTrigger="<c-tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Tagbar
let g:tagbar_zoomwidth = 0

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'jsformatter'

" NCM2

" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki

let g:LanguageClient_autoStart = 1
let g:LanguageClient_rootMarkers = {
    \ 'elixir': ['mix.exs'],
    \ }
let g:LanguageClient_serverCommands = {
  \ 'python': ['pyls'],
  \ 'typescript': ['javascript-typescript-stdio'],
  \ 'javascript': ['javascript-typescript-stdio'],
  \ 'javascript.jsx': ['javascript-typescript-stdio'],
  \ 'elixir': ['elixir-ls'],
  \ 'scala': ['/Users/jbramley/.nvm/versions/node/v11.9.0/bin/node', expand('/Users/jbramley/Code/tools/sbt-server-stdio.js')],
  \ }
"

nnoremap <F5> :call LanguageClient_contextMenu()<CR>

let g:LanguageClient_loggingFile =  expand('~/.local/share/nvim/LanguageClient.log')
let g:LanguageClient_serverStderr = expand('~/.local/share/nvim/LanguageServer.log')
let g:LanguageClient_loggingLevel = 'DEBUG'

" augroup ncm2
"   au!
"   autocmd BufEnter * call ncm2#enable_for_buffer()
"   au User Ncm2PopupOpen set completeopt=noinsert,menuone,noselect
"   au User Ncm2PopupClose set completeopt=menuone
" augroup END

" parameter expansion for selected entry via Enter
" inoremap <silent> <expr> <CR> (pumvisible() ? ncm2_ultisnips#expand_or("\<CR>", 'n') : "\<CR>")

" cycle through completion entries with tab/shift+tab
" inoremap <expr> <TAB> pumvisible() ? "\<c-n>" : "\<TAB>"
" inoremap <expr> <s-tab> pumvisible() ? "\<c-p>" : "\<TAB>"

" ncm2 settings
" autocmd BufEnter * call ncm2#enable_for_buffer()
" set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

function! CleverTab()
   if strpart( getline('.'), 0, col('.')-1 ) =~ '^\s*$'
	  return "\<Tab>"
   else
	  return "\<C-N>"
   endif
endfunction
" inoremap <Tab> <C-R>=CleverTab()<CR>

" Playing with CoC

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:UltiSnipsExpandTrigger='<Nop>'
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#rpc#request('doKeymap', ['snippets-expand', "\<TAB>"])

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" imap <tab> <Plug>(coc-snippets-expand)
" let g:coc_snippet_next = '<TAB>'


" Close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
