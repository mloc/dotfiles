let mapleader = ','

nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null

map <leader>q :setlocal paste!<cr>

map <silent> <leader><cr> :noh<cr> " quick nohl [amix]

" buffer navigation
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>

" quickfix navigation
nmap <leader>l :cn<CR>
nmap <leader>j :cp<CR>

" BufExplorer
nmap <Leader>o :ToggleBufExplorer<CR>

" NERDTree
nmap <Leader>n :NERDTreeToggle<CR>

" vim-dispatch
nnoremap <Leader>k :Dispatch<CR>

" ctrlp
let g:ctrlp_map = '<c-p>'

noremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
noremap <silent> <leader>e :call LanguageClient#textDocument_references()<CR>
