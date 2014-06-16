" ----
" PREREQUISITE
" SYSTEM CLIPBOARD with this but more importantly install mvim $brew install macvim --override-system-vim
" run vim with $mvim -v to make sure you are using the mvim for commandline
" ----

" Pathogen enable plugin support
execute pathogen#infect()

" Filetype plugin on or else plugins are fucked
filetype plugin on

" Get to system clipboard
set clipboard=unnamed 




"=====SEARCHING

" Smart case searching
set ignorecase

" Highlight result
" set hlsearch

" Make enter unhighlight it for sanity
" nnoremap <CR> :nohlsearch<CR>/<BS><CR>

" Incremental futuresitic 
set incsearch

" Show matching brackets when text indicator is over them
set showmatch


" SWP Files are so lame
set noswapfile

" Syntax
syntax on


" Let's check if file was changed outside of vim
au CursorHold * checktime

" Set to autoread when a file is changed from the outside
set autoread

" vim-expand-region git@github.com:terryma/vim-expand-region.git + _ like emacs

" Essential 50% 50% Splits
autocmd VimResized * wincmd =


" Set 1 tab at 4 spaces
set tabstop=4 
set shiftwidth=4 
set softtabstop=4

" Line Numbers
set number

" Line Numbers Pretty
highlight LineNr   ctermbg=black ctermfg=blue guibg=black guifg=white

" Mapleader should be comma
let mapleader=","

" Keep undo history across sessions, by storing in file.
" Only works all the time.
"
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" VIM PLUIGN nerdcommenter
" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1"


" Abbreviations are lazy
iab <expr> dts strftime("%c")
iab #d #define

" Gist-vim
let g:github_api_url = 'https://api.github.com'

" Instantly leave insert mode
set timeoutlen=1000 ttimeoutlen=0

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
			\ if line("'\"") > 0 && line("'\"") <= line("$") |
			\   exe "normal! g`\"" |
			\ endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""

" Height of the command bar
set cmdheight=2


"=====UX

" Turn on the WiLd menu, easy command completion with <TAB><CR>
set wildmenu

" Buffer Madness
" Mappings to access buffers (don't use "\p" because a
" delay before pressing "p" would accidentally paste).
" \l       : list buffers
" \b \f \g : go back/forward/last-used
" \1 \2 \3 : go to buffer 1/2/3 etc
nnoremap <Leader>l :ls<CR>
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>
nnoremap <Leader>x :bd<CR>
nnoremap <Leader>g :e#<CR>
nnoremap <Leader>1 :1b<CR>
nnoremap <Leader>2 :2b<CR>
nnoremap <Leader>3 :3b<CR>
nnoremap <Leader>4 :4b<CR>
nnoremap <Leader>5 :5b<CR>
nnoremap <Leader>6 :6b<CR>
nnoremap <Leader>7 :7b<CR>
nnoremap <Leader>8 :8b<CR>
nnoremap <Leader>9 :9b<CR>
nnoremap <Leader>0 :10b<CR>
" It's useful to show the buffer number in the status line.
set laststatus=2 

" Format the status line
" Status Line {  
set laststatus=2                             " always show statusbar  
set statusline=  
set statusline+=%-10.3n\                     " buffer number  
set statusline+=%f\                          " filename   
set statusline+=%h%m%r%w                     " status flags  
set statusline+=\[%{strlen(&ft)?&ft:'none'}] " file type  
set statusline+=%=                           " right align remainder  
set statusline+=0x%-8B                       " character value  
set statusline+=%-14(%l,%c%V%)               " line, character  
set statusline+=%<%P                         " file position  
"}  



" Essential Indenting
filetype off
filetype plugin indent on
set ai
set si
set paste
