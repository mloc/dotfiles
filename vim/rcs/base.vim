" - basic setup -
set nocompatible

set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set laststatus=2 " make sure air/statusline shows up

" auto-load changes + history
set autoread
set history=1024

set hidden " hide buffers

set wildmenu " tab completion

" ignore compiled files + vcs
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

" - disable backup -
set nobackup
set nowb
set noswapfile

" - searching -
set ignorecase
set smartcase
set hlsearch
set incsearch " highlight searches on the fly
set magic " regex

" matching brackets
set showmatch 
set mat=2

" Don't redraw while executing macros (good performance config)
set lazyredraw

" - editing -
syntax enable
set encoding=utf8
set ffs=unix,dos,mac " eols

filetype plugin on
filetype indent on

" indentation
set expandtab " spaces not tabs
set smarttab " be clever with tabs

set shiftwidth=4
set tabstop=4

set ai "suto indentation
set si "smart indentation
set wrap "wrap lines
