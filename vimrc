set runtimepath+=~/.vim_runtime

source ~/.vim_runtime/vimrcs/basic.vim
source ~/.vim_runtime/vimrcs/filetypes.vim
source ~/.vim_runtime/vimrcs/plugins_config.vim
source ~/.vim_runtime/vimrcs/extended.vim

call pathogen#infect('~/.vim_plugins/{}')

let g:airline_powerline_fonts = 1
set t_Co=256

let g:airline_theme = 'murmur'

let g:airline#extensions#tabline#enabled = 1
set ttimeoutlen=50


