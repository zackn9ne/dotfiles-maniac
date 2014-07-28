" Shelling Out Wont Work Right Unless
set shell=bash\ -l

set nocompatible "vundle needs
filetype off  

"   ### VUNDLE ### :BundleInstall things
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Let Vundle manage Vundle
Plugin 'gmarik/Vundle.vim'

" My Bundles
Bundle 'scrooloose/syntastic'

" We could also add repositories with a ".git" extension
Plugin 'scrooloose/nerdtree.git'
Plugin 'scrooloose/nerdcommenter.git'
Bundle 'kien/ctrlp.vim'
Bundle 'rking/ag.vim'

" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList          - list configured plugins
" :PluginInstall(!)    - install (update) plugins
" :PluginSearch(!) foo - search (or refresh cache first) for foo
" :PluginClean(!)      - confirm (or auto-approve) removal of unused plugins
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" back to work -------------------------------------------

" Leader
let mapleader = ","

set backspace=2 " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler " show the cursor position all the time
set showcmd " display incomplete commands
set incsearch " do incremental searching
set laststatus=2 " Always display the status line


" Set 1 tab at 4 spaces
set tabstop=4 
set shiftwidth=4 
set softtabstop=4

set expandtab
set noswapfile
" Smart things are smart
set si
set ai

set paste
set splitright

" Ctrlp needs to start at the 'c' - the directory of the current file.
let g:ctrlp_working_path_mode = 'c' 

" Movement between tabs OR buffers
nnoremap <silent> L :call MyNext()<CR>
nnoremap <silent> H :call MyPrev()<CR>

" MyNext() and MyPrev(): Movement between tabs OR buffers {{{
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction
" }}}


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

" Turbo leave insert mode
set timeoutlen=1000 ttimeoutlen=0

""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Height of the command bar
set cmdheight=2
