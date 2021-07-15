let mapleader="\<Space>"

" Netrw
nnoremap <leader>oo :Explore<cr>
nnoremap <leader>ot :Rexplore<cr>

"easymotion
map <leader> <Plug>(easymotion-prefix)

nnoremap <leader>q :q<cr>
nnoremap <leader>wq :wq<cr>
nnoremap <leader>u :UndotreeToggle<cr>

nnoremap <leader>as :noh<cr>
"nnoremap <leader>ar :source ~/dotfiles/nvim/init.vim<cr>

"move lines
nnoremap <S-k> :m+<cr>
nnoremap <S-j> :m-2<cr>
xnoremap <S-k> :m-2<cr>gv=gv
xnoremap <S-j> :m'>+<cr>gv=gv

"keep text selected after indentation
vnoremap < <gv
vnoremap > >gv

" Buffers
nnoremap <leader>. :Buffers<cr>
nnoremap <leader>bh :Startify<cr>
nnoremap <leader>bd :bp <bar> bd! #<cr>
nnoremap <leader>bq :bufdo bd!<cr>
"cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" Windows
nnoremap <leader>wf :Windows h<cr>
" moving between windows
nnoremap <leader>wh :wincmd h<cr>
nnoremap <leader>wj :wincmd j<cr>
nnoremap <leader>wl :wincmd l<cr>
nnoremap <leader>wk :wincmd k<cr>
" split exists window
nnoremap <leader>wv :wincmd v<cr>
nnoremap <leader>ws :wincmd s<cr>
" expand windows
nnoremap <leader>wH :<C-W>5<<cr>
nnoremap <leader>wL :<C-W>5><cr>
nnoremap <leader>wJ :vertical resize +5<cr>
nnoremap <leader>wK :vertical resize -5<cr>

" Files
nnoremap <leader>fs :w<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fg :GFiles<cr>

" Git
nnoremap <leader>ga :Git add %<cr>
nnoremap <leader>gA :Git add .<cr>
nnoremap <leader>gc :Git commit<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gp :Git push<cr>
nnoremap <leader>gP :Git pull<cr>
nnoremap <leader>gv :GV<cr>
nnoremap <leader>gdj :diffget //3<cr>
nnoremap <leader>gdf :diffget //2<cr>

" Float terminal
nnoremap <leader>tt :FloatermToggle<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
