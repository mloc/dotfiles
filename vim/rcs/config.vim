let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'

let g:syntastic_python_checkers = ['flake8', 'python']

autocmd FileType rust let b:dispatch = 'cargo build'

let g:slime_target = "tmux"
let g:slime_default_config = {"socket_name": "default", "target_pane": ".1"}
let g:slime_dont_ask_default = 1
let g:slime_python_ipython = 1
