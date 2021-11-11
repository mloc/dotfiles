set hidden

let g:rustfmt_autosave = 1
let g:go_fmt_command = "goimports"

"let g:LanguageClient_serverCommands = {
    "\ 'rust': ['~/.local/bin/rust-analyzer'],
    "\ 'go': ['~/go/bin/gopls'],
    "\ }

    "\ 'dm': ['~/.local/bin/dm-langserver'],
    "
"let g:deoplete#enable_at_startup = 1

"inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
"inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"
"nnoremap <F5> :call LanguageClient_contextMenu()<CR><Paste>

"lua <<EOF
"require'nvim-treesitter.configs'.setup {
"  ensure_installed = "maintained",
"  highlight = {
"    enable = true,
"    disable = { "dm" },
"  },
"  rainbow = {
"    enable = true,
"  },
"}
"EOF
