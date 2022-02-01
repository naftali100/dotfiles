"
" set upj vundle plugin manager
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'

" vscode dark theme
Plugin 'tomasiser/vim-code-dark'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"
" THEME SETTINGS
"

" Allow crosshair cursor highlighting.
hi CursorLine   cterm=NONE ctermbg=0
set cursorline

set linespace=3
set guifont=Fira\ Code:h12

" enable dark color theme
colorscheme codedark
let g:airline_theme = 'codedark'

map k <Down>
map j <Up>

syntax on

" set line numbers
set number
" toggle relative line numbers with leader+l
map <Leader>l :set relativenumber!<CR>

" keep the curser in the center
augroup VCenterCursor
  au!
  au BufEnter,WinEnter,WinNew,VimResized *,*.*
        \ let &scrolloff=winheight(win_getid())/2
augroup END

nnoremap <A-Down> :m .+1<CR>==
nnoremap <A-Up> :m .-2<CR>==
inoremap <A-Down> <Esc>:m .+1<CR>==gi
inoremap <A-Up> <Esc>:m .-2<CR>==gi
vnoremap <A-Down> :m '>+1<CR>gv=gv
vnoremap <A-Up> :m '<-2<CR>gv=gv

map <C-~> :term<CR>

" How many columns of whitespace a \t is worth
set tabstop=4 
" How many columns of whitespace a level of indentation is worth
set shiftwidth=4 
" Use spaces when tabbing
set expandtab

set termwinsize=12x0   " Set terminal size
set splitbelow         " Always split below
set mouse=a            " Enable mouse drag on window splits
" enable copy from and to vim
set clipboard=unnamedplus

" make arrow key to change lines
set whichwrap+=<,>,[,]
