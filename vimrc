set nocompatible
filetype off " Required by Vundle


" -- Vundle setup
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'YankRing.vim'
Plugin 'tpope/vim-surround'
Plugin 'scrooloose/syntastic'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()            " required
filetype plugin indent on    " required
" --

set vb " How about STFU
set hidden " Hidden buffers allowed for better handling of undo, etc...
set shell=/bin/zsh

syntax on

set wildmenu

set expandtab " Tab to spaces
set smarttab
set tabstop=2
set shiftwidth=2

set scrolloff=3

set ignorecase
set smartcase

set hlsearch
set ignorecase
set smartcase

set ruler

set t_Co=256 " 256 colors!!!11

set noswapfile
set background=light

if has("gui_macvim")
  colorscheme solarized
  set gfn=Source\ Code\ Pro:h14    " Setting font
  "set gfn=Roboto\ Mono:h14    " Setting font
  set go-=T             " Removing toolbar
  set go-=r             " Removing right scrollbar
  set go-=L             " Removing left scrollbar
  set number            " Linenumbers
  set cursorline
  let g:airline_powerline_fonts = 1
else
endif

let mapleader = ","

" Custom autocmds
" ---------------
augroup vimrcCustom

  " Clear this group
  autocmd! 

  " Jump to last position when file was closed
  au BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" | 
    \ endif

augroup end

nnoremap <silent> <leader>bgt :call ToggleBackground()<CR>
nnoremap <silent> <leader>hs :set hls!<CR>
nnoremap <silent> <leader>nt :NERDTree 
"
" Shortcut to .vimrc and shortcut for reloading .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
let g:NERDTreeChDirMode = 2
