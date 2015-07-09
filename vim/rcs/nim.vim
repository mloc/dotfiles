autocmd BufWrite *.nim :call DeleteTrailingWS()
autocmd FileType nim setlocal shiftwidth=2 tabstop=2
