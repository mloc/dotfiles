let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'murmur'

colorscheme molokai-mod
" let g:rehash256 = 1

set t_Co=256
set fillchars+=vert:\ 

set nu

au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
