" Appearance
syntax on

" colors are important
set encoding=utf-8
set t_Co=256
set mouse=a       " only works in iTerm
set nocompatible              " be iMproved, required
set guifont=Pragmata:h24
color elflord

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Plugin 'mattn/emmet-vim'
Plugin 'bling/vim-airline'
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

" Leader
let mapleader = ","
au CursorHold * checktime " Was it changed on disk? Move cursor and find out.

set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set hlsearch " highlight results on the go
set incsearch " do incremental searching
set laststatus=2 " Always display the status line

" Set 1 tab at 2 spaces
set tabstop=2 
set shiftwidth=2 
set softtabstop=2

set expandtab
set noswapfile

" Smart things are smart
set si
set ai
set ignorecase
set smartcase
set incsearch

set paste
set splitright

" ControlP config
let g:ctrlp_working_path_mode = 'c' 

" Keep undo history across sessions, by storing in file.
" Only works all the time.
"
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" Let's check if file was changed outside of vim
au CursorHold * checktime

" Set to autoread when a file is changed from the outside
set autoread

""""""""""""""""""""""""""""""
" => Cursor line
""""""""""""""""""""""""""""""
" Sets CursorLine color to a smooth background, no underline
highlight CursorLine   cterm=NONE ctermfg=NONE ctermbg=235 guibg=Grey40
highlight CursorColumn cterm=NONE ctermfg=NONE ctermbg=235 guibg=Grey48
set cursorline cursorcolumn     " Show a 'cross' that pinpoints to the cursor position
set splitright                  " New window on rightside when vsplit
set splitbelow                  " New window on bottomside when hsplit

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Height of the command bar
set cmdheight=2




" ==================== Keybind and commands ==================== "
" set timeoutlen=1000 ttimeoutlen=0
set timeout " Do time out on mappings and others
set timeoutlen=2000 " Wait {num} ms before timing out a mapping

" When you’re pressing Escape to leave insert mode in the terminal, it will by
" default take a second or another keystroke to leave insert mode completely
" and update the statusline. This fixes that. I got this from:
" https://powerline.readthedocs.org/en/latest/tipstricks.html#vim
if !has('gui_running')
    set ttimeoutlen=10
    augroup FastEscape
        autocmd!
        au InsertEnter * set timeoutlen=0
        au InsertLeave * set timeoutlen=1000
    augroup END
endif

" Tab move
nnoremap <C-n> gt
nnoremap <C-p> gT

" NERDCommenter
let g:NERDSpaceDelims = 1

" Command completion
" set wildmenu                   " enhance command completion
" set wildmode=list:longest,full " first 'list:lingest' and second 'full'

" Search & Replace
set showmatch  

" Tab line
set showtabline=2 " always show tab bar
set noshowmode

" Messages
set esckeys
set shortmess=a

" File Edit View History Window ETC
nnoremap <leader>re :source $MYVIMRC<cr>:echo "sourced"<cr> 
nnoremap <leader>e :vi $MYVIMRC<cr>:echo "loaded prefs"<cr> 
