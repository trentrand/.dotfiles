set nocompatible

" Enable true color
if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Plugins
call plug#begin()
Plug 'sainnhe/everforest'
Plug 'swalladge/paper.vim'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
"" Unused Plugins
" Plug 'oguzbilgic/vim-gdiff'
" Plug 'airblade/vim-gitgutter'
" Plug 'https://github.com/ElHacker/vim-gitstatus.git'
" Plug 'tpope/vim-repeat'
" Plug 'sheerun/vim-polyglot'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
" Plug 'chrisbra/unicode.vim'
" Plug 'jesseleite/vim-agriculture'
" Plug 'suan/vim-instant-markdown'
" Plug 'Freedzone/kerbovim'
" Plug 'cstrahan/vim-capnp'
" Plug 'b4winckler/vim-objc'
call plug#end()

" Theme
let g:airline_theme = 'everforest'
set guifont=Fira_Code

" Inside? Turn on these!
set background=dark
colorscheme everforest

" Outside? Turn on these!
" set background=light
" colorscheme paper

" General
syntax on
set number relativenumber " Show line numbers
set nowrap	" Wrap lines
set showbreak=+++	" Wrap-broken line prefix
set textwidth=120	" Line wrap (number of cols)
set showmatch	" Highlight matching brace
set spell	" Enable spell-checking
set mouse=a " Enable mouse for all modes

set hlsearch	" Highlight all search results
set smartcase	" Enable smart-case search
set ignorecase	" Always case-insensitive
set incsearch	" Searches for strings incrementally
set autoread  " Auto-reload files changes by a background process
filetype indent on
set shiftwidth=2	" Number of auto-indent spaces
set tabstop=2     " Use 2 spaces instead of tabs
set softtabstop=2	" Number of spaces per Tab
set expandtab	  " Use 2 spaces instead of tabs
set smartindent	" Enable smart-indent
set smarttab	" Enable smart-tabs

set ruler	" Show row and column ruler information
set noshowmode  " Hide operator prompt, replaced by vim-airline (e.g. -- INSERT --)
set autoread
set undolevels=1000	" Number of undo levels
set backspace=indent,eol,start	" Backspace behaviour
set clipboard=unnamed " Yank and paste with the system keyboard

" Settings learned from Practical Vim
set history=200 " Increase cleanup threshold for <Up> Ex Command and `/` buffer search auto-complete
set wildmenu " Enable <C-d> navigable history list rather than <tab> cycling through individual entries
set wildmode=full
" End

set directory^=$HOME/.vim/swap// " Store swap files in consolidated location, outside of project
set suffixesadd+=.js " When using the gf command, it will attempt to navigate to <filename>.js
set path+=$PWD/node_modules " When using the gf command on a package import, it'll navigate to node_modules/<filename>

" Rulers
let &colorcolumn="80,".join(range(120,999),",")

" Set fzf colors to match color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Functional Keybindings
nnoremap <F4> :%s/<c-r><c-w>/
nmap <F5> :NERDTreeToggle %<CR>
nmap <F6> :NERDTreeFind <CR>
nmap <F7> <C-w>H <CR>
nmap <F8> <C-w>K <CR>

" Search files (also moves cursor if on nerd tree)
nnoremap <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"

" search buffers (also moves cursor if on nerd tree)
nnoremap <silent> <expr> <C-o> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

" Pane forward and backward
nnoremap <Tab> <c-w>w
nnoremap <S-Tab> <c-w>W

" Quickfix
" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! RemoveQFItem()
  let curqfidx = line('.') - 1
  let qfall = getqflist()
  call remove(qfall, curqfidx)
  call setqflist(qfall, 'r')
  execute curqfidx + 1 . "cfirst"
  :copen
endfunction
:command! RemoveQFItem :call RemoveQFItem()
" Use map <buffer> to only map dd in the quickfix window. Requires +localmap
autocmd FileType qf map <buffer> dd :RemoveQFItem<cr>

" Autocommands
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" === Coc.nvim === "
" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" === FZF.vim Rg === "
" Complete file relative path for imports
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
    \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
    \ fzf#wrap({'dir': expand('%:p:h')}))

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ 'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \ fzf#vim#with_preview({
  \   'options': ['--bind', '?:preview:cat {}', '--preview-window', 'hidden'],
  \   'dir': systemlist('git rev-parse --show-toplevel')[0]
  \ }, 'down:50%'), <bang>0)
