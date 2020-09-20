call plug#begin('~/.local/share/nvim/plugged')

" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
Plug 'tmhedberg/SimpylFold'

" To comment out a single line, use <leader>cc
" To un-comment a line, use <leader>cu
Plug 'scrooloose/nerdcommenter'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Common
Plug 'easymotion/vim-easymotion'
Plug 'Yggdroot/indentLine'
Plug '907th/vim-auto-save'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
Plug 'Yggdroot/indentLine'

Plug 'norcalli/nvim-colorizer.lua'

" Python
Plug 'dense-analysis/ale', {'for': 'python'}

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'


call plug#end()

"syntax on
syntax enable
set t_Co=256
filetype plugin on
set background=dark
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
"set colorcolumn=120
set textwidth=120
set noswapfile
set number relativenumber
set termencoding=UTF-8
set fileencodings=UTF-8
set autoindent
set showmatch
set updatetime=50
set ttyfast
set ttimeout
set ttimeoutlen=50
set backspace=indent,eol,start whichwrap+=<,>,[,]
set showcmd
set wildmenu
set wildmode=longest:full,full
set hidden
set laststatus=2
set nowrap
set nopaste
set splitright
set smartcase
set ignorecase
set hlsearch
set incsearch
set nobackup
"set completeopt-=preview
set completeopt=menuone,noinsert,noselect
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
"set signcolumn=yes


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Python
" colorcolumn=80
autocmd Filetype python setlocal expandtab textwidth=79
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

" autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1

"example for xfce4-terminal
set termguicolors

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
	let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
	let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'

"schemes
"colorscheme onedark
colorscheme gruvbox

let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" fzf.vim
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '▏'

" ale
let g:ale_linters = {'python': ['mypy']}
let g:ale_linters_explicit = 1

let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua require'nvim_lsp'.tsserver.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.pyls.setup{ on_attach=require'completion'.on_attach }
lua require'nvim_lsp'.jdtls.setup{ on_attach=require'completion'.on_attach }

lua require'colorizer'.setup()

"==========================================================================
"mapping

let mapleader="\<Space>"

"map <leader>s :NERDTreeToggle<cr>
map <F2> :NERDTreeToggle<cr>

"easymotion
map <leader> <Plug>(easymotion-prefix)

"move lines
nnoremap <S-k> :m+<cr>
nnoremap <S-j> :m-2<cr>
xnoremap <S-k> :m-2<cr>gv=gv
xnoremap <S-j> :m'>+<cr>gv=gv

"keep text selected after indentation
vnoremap < <gv
vnoremap > >gv

"move between buffers
nnoremap <leader>T :enew<cr>
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <leader>bq :bp <bar> bd! #<cr>
nnoremap <leader>ba :bufdo bd!<cr>
"cycle between last two open buffers
nnoremap <leader><leader> <c-^>

" close buffers without closing window
map <leader>q :bp<bar>sp<bar>bn<bar>bd<cr>

" moving between windows
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>l :wincmd l<cr>
nnoremap <leader>k :wincmd k<cr>

" split exists window
nnoremap <C-l> :wincmd v<cr>
nnoremap <C-j> :wincmd s<cr>

nnoremap <silent> <Leader>\ :vertical resize +5<cr>
nnoremap <silent> <Leader>- :vertical resize -5<cr>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Git
nnoremap <leader>gs :G<cr>
nnoremap <leader>gj :diffget //3<cr>
nnoremap <leader>gf :diffget //2<cr>
nnoremap <leader>gc :Gcommit<cr>

" GitGutter
nnoremap ]h <Plug>(GitGutterNextHunk)
nnoremap [h <Plug>(GitGutterPreviewHunk)
nnoremap ghs <Plug>(GitGutterStageHunk)
nnoremap ghu <Plug>(GitGutterUndoHunk)

" fzf.vim
nnoremap <C-p> :GFiles<cr>
nnoremap <C-f> :Files<cr>
nnoremap <S-b> :Buffers<cr>

" LSP keys
nnoremap <leader>vd :lua vim.lsp.buf.definition()<cr>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<cr>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<cr>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<cr>
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<cr>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<cr>

"exit
nnoremap <S-q> :q<cr>
