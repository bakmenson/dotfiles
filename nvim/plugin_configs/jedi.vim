"<leader>d: go to definition
"K: check documentation of class or method
"<leader>n: show the usage of a name in current file
"<leader>r: rename a name

" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"
