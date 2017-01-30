" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()
autocmd BufWrite *.rs :call DeleteTrailingWS()

" Persistent/Saved undo
try
    set undodir=~/.vim/undodir
    set undofile
catch
endtry

" ignore whitespace in diffs
if &diff
    set diffopt+=iwhite
endif

" open quickfix after grep
autocmd QuickFixCmdPost *grep* cwindow
