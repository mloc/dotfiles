let mapleader = ','

nmap <leader>w :w!<cr>
command W w !sudo tee % > /dev/null

map <leader>p :setlocal paste!<cr>

map <silent> <leader><cr> :noh<cr> " quick nohl [amix]

" buffer navigation
nmap <leader>] :bn<CR>
nmap <leader>[ :bp<CR>

" quickfix navigation
nmap <leader>l :cn<CR>
nmap <leader>j :cp<CR>

" BufExplorer
nmap <Leader>o :Telescope buffers<CR>

" NERDTree
nmap <Leader>n :Telescope file_browser<CR>

" vim-dispatch
nnoremap <Leader>k :Dispatch<CR>

nmap <c-p> :Telescope find_files<CR>
nmap <c-f> :Telescope live_grep<CR>
nmap <c-h> :Telescope diagnostics<CR>

noremap <silent> <leader>d :call LanguageClient#textDocument_definition()<CR>
noremap <silent> <leader>e :call LanguageClient#textDocument_references()<CR>
