inoremap jj <ESC>

set scrolloff=5

set nocompatible

syntax on

" Set the number of spaces that a <Tab> counts for
set tabstop=4

" Set the number of spaces to use for each step of (auto)indent
set shiftwidth=4

" Use spaces instead of tabs
set expandtab

" Enable automatic indentation
set autoindent
set smartindent

" Show line numbers
set number

" Enable relative line numbers
set relativenumber

" Highlight the current line
set cursorline

" Enable syntax highlighting
syntax enable

" Enable file type detection and plugin
filetype plugin indent on

" Enable searching with incremental search
set incsearch

" Highlight search results
set hlsearch

" Ignore case in search patterns
set ignorecase

" Override ignorecase if search pattern contains uppercase letters
set smartcase

" Enable line wrapping
set wrap

" Show matching parentheses
set showmatch

" Enable mouse usage in all modes
set mouse=a

" Set the color scheme (optional: change to your preference)
colorscheme desert

" Enable persistent undo
if has("persistent_undo")
    set undofile
    set undolevels=1000
    set undoreload=10000
endif

" Enable clipboard support (use system clipboard)
set clipboard=unnamedplus

" Set the status line to always be visible
set laststatus=2

" Enable a better display for messages
set cmdheight=2

" Reduce delay for key mappings
set timeoutlen=300

" Enable spell checking (optional)
" set spell

" Shorten command display to one line
set shortmess+=c

" Disable swap files (optional: can prevent recovery)
set noswapfile

" Enable backup files (optional: for safety)
set backup
set backupdir=~/.vim/backups

" Set encoding
set encoding=utf-8

" Enable line breaking at word boundaries
set linebreak

" Allow hidden buffers (switching buffers without saving)
set hidden

" ================================
" Key Mappings
" ================================

" Remap leader key to comma
let mapleader=" "

" Save the current file
nnoremap <C-w> :w<CR>
inoremap <C-w> <Esc>:w<CR>a

" Quit Vim
nnoremap <C-q> :q<CR>
inoremap <C-q> <Esc>:q<CR>

" Quickly split window vertically with Ctrl+v
nnoremap <C-v> :vsplit<CR>

" Quickly split window horizontally with Ctrl+h
nnoremap <C-h> :split<CR>

" Navigate between splits using Ctrl + arrow keys
nnoremap <C-Left> :wincmd h<CR>
nnoremap <C-Down> :wincmd j<CR>
nnoremap <C-Up> :wincmd k<CR>
nnoremap <C-Right> :wincmd l<CR>

" ================================
" Additional Settings
" ================================

" Set up a status line (simple version)
set statusline=%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P

" Improve command line completion
set wildmenu
set wildmode=longest:full,full

" Enable auto read when file is changed outside of Vim
set autoread

" Highlight trailing whitespace (optional)
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Remove highlighting after search
nnoremap <silent> <Esc> :nohlsearch<CR><Esc>

" ================================
" End of Configuration
" ================================
