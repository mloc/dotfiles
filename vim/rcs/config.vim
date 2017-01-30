let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++14'

let g:syntastic_python_checkers = ['flake8', 'python']

let g:racer_cmd = "/home/mloc/.multirust/toolchains/stable/cargo/bin/racer"
let $RUST_SRC_PATH="/home/mloc/devel/rust-1.8.0/src"
autocmd FileType rust let b:dispatch = 'cargo build'
