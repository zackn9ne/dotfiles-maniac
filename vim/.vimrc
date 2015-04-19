set nocompatible " be iMproved
execute pathogen#infect()

"pretty essention so it know what type of file you in
filetype plugin on

" Edit promiscious mode
set buftype=

" Setsyntax
syntax on

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

"no junk
set nobackup
set nowritebackup
set noswapfile

"statusline setup
set statusline =%#identifier#
set statusline+=[%t]    "tail of the filename
set statusline+=%*

if v:version >= 703
    "undo settings
    set undodir=~/.vim/undofiles
    set undofile

    set colorcolumn=+1 "mark the ideal max text width
endif

"scroller
set scrolloff=3
set sidescrolloff=7

" Normal leader key
let mapleader = ","

set t_Co=256
set noswapfile

" Tabs, indenting please be normal allows gg=G
filetype indent on
set si
set ai
set tabstop=2 
set shiftwidth=2 
set softtabstop=2
set expandtab

" Pasting is nice
set paste

" Lovely linenumbers
set nu

" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
" Remove highlights with leader + enter
nmap <Leader><CR> :nohlsearch<cr>

" Buffer switching
map <leader>p :bp<CR> " \p previous buffer
map <leader>n :bn<CR> " \n next buffer
map <leader>d :bd<CR> " \d delete buffer

map <leader>t :A<CR> " \t to jump to test file
map <leader>r :r<cr> " \t to jump to related file
map <leader>E :Explore .<cr> " \E to open file explorer in root
map <leader>e :Explore<cr> " \e to open file explorer in current dir

 

" Syntax highlighting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
