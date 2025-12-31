syntax on               " enable syntax highlighting
set nobackup            " don't create pointless backup files; Use VCS instead
set autoread            " watch for file changes
set number              " show line numbers
set showcmd             " show selection metadata
set showmode            " show INSERT, VISUAL, etc. mode
set showmatch           " show matching brackets
set smarttab            " better backspace and tab functionality
set scrolloff=5         " show at least 5 lines above/below
filetype on             " enable filetype detection
filetype indent on      " enable filetype-specific indenting
filetype plugin on      " enable filetype-specific plugins

" tabs and indenting
set autoindent          " auto indenting
set smartindent         " smart indenting
set expandtab           " spaces instead of tabs
set tabstop=2           " 2 spaces for tabs
set shiftwidth=2        " 2 spaces for indentation
set wrap                " auto wrap long lines

" bells
set noerrorbells        " turn off audio bell
set novisualbell        " turn off visual bell

" search
set hlsearch            " highlighted search results
set showmatch           " show matching bracket

" clipboard
set clipboard=unnamed   " allow yy, etc. to interact with OS X clipboard

" turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

set encoding=utf8       " use utf-8 encoding

" keymaps
let mapleader = " "          " set leader key to space

nnoremap <leader>w :w!<CR>   " leader+w to save
nnoremap <leader>q :q!<CR>   " leader+q to quit
nnoremap <leader>h :noh<CR>  " leader+h to clear search highlighting
nnoremap <Esc> :noh<CR><Esc> " Esc to clear search highlighting 

inoremap jk <Esc>            " jk to escape in insert mode
inoremap kj <Esc>            " kj to escape in insert mode
inoremap <Esc> :noh<CR><Esc> " Esc to clear search highlighting 
