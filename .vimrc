" Pathogen
execute pathogen#infect()
filetype plugin indent on

" Essential
syntax enable
set expandtab     
set shiftwidth=4 
set autoindent  
set smartindent 
set clipboard=unnamed

" change the mapleader from \ to ,
let mapleader=","

" Search
set ignorecase smartcase

" Color scheme
"color hhdgray

" Formatting
set nowrap
set tabstop=4 shiftwidth=4 softtabstop=4

" Status line
"set statusline=%F%(\ %h%1*%m%*%r%w%)\ (%{&ff}%(\/%Y%))\ [\%03.3b]\ [0x\%02.2B]%=%-14.(%l,%c%V%)\ %P/%L
