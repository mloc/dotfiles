let mapleader = ','

nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null

map <leader>q :setlocal paste!<cr>

map <silent> <leader><cr> :noh<cr> " quick nohl [amix]

" buffer navigation
nmap <Leader>p :bn<CR>
nmap <Leader>i :bp<CR>

" BufExplorer
nmap <Leader>o :ToggleBufExplorer<CR>

" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" vim-dispatch
nnoremap <Leader>k :Make<CR>

" ctrlp
let g:ctrlp_map = '<c-f>'
