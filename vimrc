call pathogen#infect('~/.vim/bundle/{}')

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin("~/.vim/vundle")

Plugin 'VundleVim/Vundle.vim'
source ~/.vim/rcs/plugins.vim
call vundle#end()
filetype plugin indent on

source ~/.vim/rcs/base.vim
source ~/.vim/rcs/keys.vim
source ~/.vim/rcs/appearance.vim
source ~/.vim/rcs/convenience.vim
source ~/.vim/rcs/config.vim
source ~/.vim/rcs/local.vim

source ~/.vim/rcs/nim.vim

set ttimeoutlen=50
set noshowmode

set diffexpr=""

set switchbuf=useopen
