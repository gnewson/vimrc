" Basic settings -------------------- {{{
"
" This must be set first as it changes other options as a side effect
set nocompatible

" Use pathogen to easily modify the runtime path to include all
" plugins under the ~/.vim/bundle directory
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on	" Automatically detect file types
syntax on 	" syntax highlighting

set tabpagemax=15 " only show 15 tabs
set showmode    " display the current mode
set cursorline  " highlight current line
set incsearch 	" find as you type search
set number	" line numbers on
set showmatch	" show matching brackets / parentheses
set ignorecase	" case insensitive search
set smartcase	" case sensitive when upper case used
" }}}

" Vim UI -------------------- {{{
set background=dark		" Assume a dark background
let g:solarized_termtrans = 1 "solarized param for terminal transparency.  Looks crap without it
color solarized " load a colorscheme
" }}}

" Status line -------------------- {{{
  if has('cmdline_info')
    set ruler " show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%) " a ruler on steroids
    set showcmd " show partial commands in status line and
		" selected characters/lines in visual mode
  endif

  if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\ 	" Filename
    set statusline+=%w%h%m%r 	" Options
   " set statusline+=%{fugitive#statusline()} 	" Git Hotness
    set statusline+=\ [%{&ff}/%Y] 		" filetype
   " set statusline+=\ [%{getcwd()}] 		" current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%%\ of\ %L 	" Right aligned file nav info
  endif

" }}}


" Key (re)Mappings -------------------- {{{
let mapleader = ","
let maplocalleader = "\\"

inoremap <esc> <nop>
inoremap jk <esc>

" clearing highlighted search
nnoremap <silent> <leader>/ :nohlsearch<CR>

" Yank from the cursor to the end of the line, to be consistent with C and D
nnoremap Y y$

nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" shortcuts for tasklist
map T :TaskList<CR>
map P :TlistToggle<CR>
" }}}

" FileType specific settings --------------------  {{{
" Set up for python
" Code folding to hide methods
set foldmethod=indent
set foldlevel=99

set expandtab
set textwidth=79
set tabstop=8
set softtabstop=4
set shiftwidth=4
set autoindent

" autocommands wrapped in augroups so that multiple copies of the autocmds aren't generated
augroup general
    autocmd!
    autocmd BufNewFile * :write
augroup END
augroup filetype_python
    autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python set omnifunc=pythoncomplete#Complete	" Turn on omni completion for python
augroup END
augroup filetype_c
    autocmd!
    autocmd FileType c :iabbrev <buffer> pf printf("",);
augroup END
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Abbreviations -------------------- {{{
" abbreviations for typos
iabbrev LIPT LITP
iabbrev adn and
" }}}

