set nocompatible
set vb " How about STFU
set hidden " Hidden buffers allowed for better handling of undo, etc...
set shell=/bin/zsh

"call pathogen#infect()
"call pathogen#helptags()


syntax on
filetype plugin indent on

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

if has("gui_macvim")
  colorscheme solarized
  set background=dark
  set gfn=Source\ Code\ Pro:h14    " Setting font
  "set gfn=Roboto\ Mono:h14    " Setting font
  set go-=T             " Removing toolbar
  set go-=r             " Removing right scrollbar
  set go-=L             " Removing left scrollbar
  set number            " Linenumbers
  set cursorline
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

function! ToggleBackground()
  if &background == 'dark'
    set background=light
  else
    set background=dark
  end
  return &background
endfunction

function! ToggleHls()
  if &hlsearch
    set nohls
  else
    set hls
  end
endfunction

nnoremap <silent> <leader>bgt :call ToggleBackground()<CR>
nnoremap <silent> <leader>hs :call ToggleHls()<CR>
nnoremap <silent> <leader>nt :NERDTree 
"
" Shortcut to .vimrc and shortcut for reloading .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

"let g:syntastic_php_checkers = ['phpcs']

"if executable('ag')
"  let g:ackprg = 'ag --vimgrep'
"endif
"let g:airline_powerline_fonts = 1
