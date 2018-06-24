call plug#begin('~/.vim/plugged')

Plug 'johngrib/vim-game-code-break'

call plug#end()

execute pathogen#infect()

"Enable syntax highlighting and inednting
syntax on
filetype plugin indent on

"Custom key mappings
inoremap jk <ESC>

"Make it so we can delete indent and across lines in insert mode
set backspace=indent,eol,start

"By default, expand tabs to four spaces, but not in some filetypes
set softtabstop=4
set shiftwidth=4
set expandtab
"autocmd Filetype html setlocal tabstop=2

"Highlight current line
set cursorline
hi CursorLine   cterm=NONE ctermbg=DarkGrey ctermfg=NONE

set nocompatible
set number
set nowrap
set showmode
set tw=80
set smartcase
set smarttab
set smartindent
set autoindent
set incsearch
set mouse=a
set history=1000
set clipboard=unnamedplus,autoselect

set completeopt=menuone,menu,longest

set wildignore+=*\\tmp\\*,*.swp,*.swo,*.zip,.git,.cabal-sandbox
set wildmode=longest,list,full
set wildmenu
set completeopt+=longest

set t_Co=256

set cmdheight=1

"Stuff for Haskell syntax highlighting
let g:haskell_classic_highlighting = 1
let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords

"Nerdtree config settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


"Stuff for the vim-airline plugin
let g:airline#extensions#syntastic#enabled = 1

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

let g:airline_powerline_fonts = 1
let g:airline_theme = "solarized"
let g:airline_solarized_bg = "dark"
