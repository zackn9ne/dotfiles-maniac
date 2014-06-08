" Powerline on
set rtp+=/usr/local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

" Syntax
syntax on

" Pasting things is good
set paste

" Let's check if file was changed outside of vim
au CursorHold * checktime

" Pathogen
execute pathogen#infect()
" vim-expand-region git@github.com:terryma/vim-expand-region.git + _ like emacs

	" Essential 50% 50% Splits
	autocmd VimResized * wincmd =

	" Essential Indenting
	set smartindent 
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

" Autoload Changed .vimrc
augroup reload_vimrc " {
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Abbreviations are lazy
iab <expr> dts strftime("%c")
iab #d #define
