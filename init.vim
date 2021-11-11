runtime preconfig.vim

call plug#begin('~/.local/share/nvim/plugged')
runtime plugins.vim
call plug#end()

set timeoutlen=1000 ttimeoutlen=0

runtime base.vim
runtime keys.vim
runtime appearance.vim
runtime config.vim
runtime lsp.vim
"runtime coc.vim
