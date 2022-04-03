"
" set up vundle plugin manager
"

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" vim-airline
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-airline/vim-airline'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'tomasiser/vim-code-dark'            " vscode dark theme
" Plugin 'mangeshrex/uwu.vim'               " theme
" Plugin 'wuelnerdotexe/vim-enfocado'
Plugin 'tpope/vim-fugitive'                 " git support
Plugin 'ryanoasis/vim-devicons'             " icons
Plugin 'preservim/nerdtree'                 " file tree
Plugin 'tpope/vim-commentary'               " comment lines
Plugin 'neoclide/coc.nvim'                  " auto complete

call vundle#end()                           " required
filetype plugin indent on                   " required"

" THEME SETTINGS
"
" random colorscheme
" hybrid_reverse
let my_colors = ['happy_hacking', 'codedark', 'torte', 'deus', 'slate', 'solarized8_flat', 'dogrun', 'seoul256', 'twilight256', 'angr']
:execute 'colo' my_colors[rand() % len(my_colors)]
" function RandomColorScheme()
"      let mycolors = split(globpath(&rtp,"**/colors/*.vim"),"\n") 
"        exe 'so ' . mycolors[localtime() % len(mycolors)]
"          unlet mycolors
"      endfunction

" call RandomColorScheme()
" :command NewColor call RandomColorScheme()
" let g:airline_theme = 'enfocado'
" set termguicolors
" let g:enfocado_style = 'neon' " Available: `nature` or `neon`.
" autocmd VimEnter * ++nested colorscheme enfocado

" colorscheme uwu
" To enable
" let g:UwuNR=1 " default

" hi CursorLine   cterm=NONE ctermbg=0 ctermfg=white guibg=darkred guifg=white
hi CursorLine cterm=NONE ctermbg=0 ctermfg=0     " Allow crosshair cursor highlighting.
set cursorline
set guifont="jetBrainsMono Nerd Font" 12
set linespace=3
set number                                  " set line numbers
set tabstop=4                               " How many columns of whitespace a \t is worth
set shiftwidth=4                            " How many columns of whitespace a level of indentation is worth
set expandtab                               " Use spaces when tabbing
set termwinsize=12x0                        " Set terminal size
set splitbelow                              " Always split below
set mouse=a                                 " Enable mouse drag on window splits
set whichwrap+=<,>,[,] " make arrow key to change lines
set ttimeoutlen=10
set wildmenu
set wildmode=longest,list,full
" set guifont=Fira\ Code:h12
" set clipboard=unnamedplus " enable copy from and to vim
" colorscheme codedark " enable dark color theme
" let g:airline_theme = 'codedark'

map k <Down>
map j <Up>
map <Leader>l :set relativenumber!<CR> " toggle relative line numbers with leader+l

syntax on


nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-Down> :m .+1<CR>==
nnoremap <C-Up> :m .-2<CR>==
inoremap <C-Down> <Esc>:m .+1<CR>==gi
inoremap <C-Up> <Esc>:m .-2<CR>==gi
vnoremap <C-Down> :m '>+1<CR>gv=gv
vnoremap <C-Up> :m '<-2<CR>gv=gv

map <C-~> :term<CR>

inoremap <expr> <Tab> pumvisible() ? coc#_select_confirm() : "<Tab>"

" Allow saving of files as sudo when I forgot to start vim using sudo.
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" keep the curser in the center
" augroup VCenterCursor
"  au!
"  au BufEnter,WinEnter,WinNew,VimResized *,*.*
"        \ let &scrolloff=winheight(win_getid())/2
" augroup END
