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
