set hidden

let g:go_fmt_command = "goimports"

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'go': ['~/go/bin/gopls'],
    \ }

let g:deoplete#enable_at_startup = 1

inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
nnoremap <F5> :call LanguageClient_contextMenu()<CR><Paste>
