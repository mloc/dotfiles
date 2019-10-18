set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set so=3

" auto-load changes + history
set autoread
set history=1024

set hidden " hide buffers

" ignore compiled files + vcs
set wildignore=*.o,*~,*.pyc
set wildignore+=.git\*,.hg\*,.svn\*

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

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()

" Persistent/Saved undo
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" ignore whitespace in diffs
if &diff
    set diffopt+=iwhite
endif

" open quickfix after grep
autocmd QuickFixCmdPost *grep* cwindow
