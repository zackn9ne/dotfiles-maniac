" Pathogen
execute pathogen#infect()

" Essential
filetype plugin on
filetype indent on
set clipboard=unnamed
set ignorecase smartcase
set paste
syntax enable
set nu
set noswapfile

" Essential 50% 50% Splits
autocmd VimResized * wincmd =

" Essential Indenting
set smartindent 
set tabstop=4 
set shiftwidth=4 
set softtabstop=4

" Trying Out

function! MakeSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/session.vim'
  exe "mksession! " . b:filename
endfunction

function! LoadSession()
  let b:sessiondir = $HOME . "/.vim/sessions" . getcwd()
  let b:sessionfile = b:sessiondir . "/session.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
au VimEnter * nested :call LoadSession()
au VimLeave * :call MakeSession()

"
"" Bash like keys for the command line. These resemble personal zsh mappings
map <c-a> <home>
map <c-e> <end>
"

" Always leave a space between the comment character and the comment
let NERDSpaceDelims=1"

" ================ Status Line ====================
set statusline+=%y 


" Cool Things

" ================ Persistent Undo ====================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
"
if has('persistent_undo')
	silent !mkdir ~/.vim/backups > /dev/null 2>&1
	set undodir=~/.vim/backups
	set undofile
endif

" ================ Tabs & Spaces Show =================
set list 
set listchars=tab:▸\ 


" ================ VIM Mapleader , == =================
let mapleader=","

" ================ Color Schemes Cool =================
" broken :(
colorscheme default

" Things For Plugins
let g:ctrlp_working_path_mode = 'c'
