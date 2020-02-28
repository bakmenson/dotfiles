"====================== vim-plug ==========================================

" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" On-demand loading
"common
Plug 'Valloric/YouCompleteMe'
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'jiangmiao/auto-pairs'
Plug 'skywind3000/asyncrun.vim'
" To use ag.vim - sudo apt-get install silversearcher-ag
Plug 'rking/ag.vim'
Plug 'Yggdroot/indentLine'
Plug '907th/vim-auto-save'
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

"HTML
Plug 'gregsexton/MatchTag', { 'for': ['html', 'javascript'] }
Plug 'mattn/emmet-vim', { 'for': ['html', 'javascript'] }
Plug 'othree/html5.vim', { 'for': ['html', 'javascript'] }
Plug 'hail2u/vim-css3-syntax', { 'for': ['css', 'scss'] }

"CSS/LESS/Stylus/SCSS
Plug 'ap/vim-css-color', { 'for': ['css', 'scss', 'sass', 'less', 'stylus'] }

"JavaScript
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'othree/es.next.syntax.vim', { 'for': 'javascript' }
Plug 'wizicer/vim-jison', { 'for': 'jison' }
Plug 'posva/vim-vue', { 'for': ['javascript', 'typescript'] }

"Python
Plug 'sheerun/vim-polyglot'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'vim-python/python-syntax'
Plug 'dense-analysis/ale', {'for': 'python'}
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }

"Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

call plug#end()

"==========================================================================

" Initialize plugin system
"syntax on
syntax enable
set t_Co=256
filetype plugin on
set tabstop=4
set shiftwidth=4
set softtabstop=4
set encoding=UTF-8
set termencoding=UTF-8
set fileencodings=UTF-8

"set spaces for different languages
"expandtab for tabs to spaces
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
" delete all spaces in the end lines
autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

set mousehide
set mouse=a

autocmd FileType java setlocal omnifunc=javacomplete#Complete

" indent when moving to the next line while writing code
set autoindent

" show the matching part of the pair for [] {} and ()
set showmatch

"show line lenght
set colorcolumn=120
set updatetime=100

"more characters will be sent to the screen for redrawing
set ttyfast

"time waited for key press(es) to complete. It makes for a faster key response
set ttimeout
set ttimeoutlen=50

"make backspace behave properly in insert mode
set backspace=indent,eol,start whichwrap+=<,>,[,]

"display incomplete commands
set showcmd

"a better menu in command mode
set wildmenu
set wildmode=longest:full,full

"hide buffers instead of closing them even if they contain unwritten changes
set hidden

"disable soft wrap for lines
"set nowrap
set wrap
set linebreak

"always display the status line
set laststatus=2

"display line numbers on the left side
set number relativenumber

set smartcase

"highlight current line
"set cursorline

"searches are case insensitive unless they contain at least one capital letter
set ignorecase
set hlsearch
set incsearch
set nobackup
set noswapfile
set completeopt-=preview

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

"==========================================================================

" Java syntax highlight
let java_highlight_functions = 1
let java_highlight_all = 1

" vim-python/python-syntax
let g:python_highlight_all = 1

" ale
let b:ale_linters = {'python': ['flake8', 'mypy']}
let g:ale_linters_explicit = 1

" autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1

"==========================================================================

"schemes
set background=dark
colorscheme onedark
"colorscheme gruvbox

"example for xfce4-terminal
set termguicolors

"airline-themes
"let g:airline_theme='gruvbox'
let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '▏'

" emmet
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key='<C-Z>'

" ycm
let g:ycm_collect_identifiers_frm_tags_files = 1
let g:ycm_use_ultisnips_completer = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1

"==========================================================================
" run a python script
" :AsyncRun -raw python %

"==========================================================================
"mappings

"Vim makes it possible to formally define two leaders: "," or "\<Space>"
let mapleader="\<Space>"

map <leader>s :NERDTreeToggle<cr>

"easymotion
map <leader> <Plug>(easymotion-prefix)

"move line
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

"move tabs
" :tabmove +1
" :tabmove -1

"move to the window in the direction shown, or create a new window
nnoremap <silent> <C-h> :call WinMove('h')<cr>
nnoremap <silent> <C-j> :call WinMove('j')<cr>
nnoremap <silent> <C-k> :call WinMove('k')<cr>
nnoremap <silent> <C-l> :call WinMove('l')<cr>
function! WinMove(key)
	let t:curwin = winnr()
	exec "wincmd ".a:key
	if (t:curwin == winnr())
		if (match(a:key,'[jk]'))
			wincmd v
		else
			wincmd s
		endif
		exec "wincmd ".a:key
	endif
endfunction

nnoremap <silent> <Leader>\ :vertical resize +5<cr>
nnoremap <silent> <Leader>- :vertical resize -5<cr>

map <C-Y> :call yapf#YAPF()<cr>
map <C-Y> <c-o>:call yapf#YAPF()<cr>

"==============================================================

" coc.nvim
" tab for trigger completion
"inoremap <silent><expr> <TAB>
"		\ pumvisible() ? "\<C-n>" :
"		\ <SID>check_back_space() ? "\<TAB>" :
"		\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
"
"function! s:check_back_space() abort
"	let col = col('.') - 1
"	return !col || getline('.')[col - 1]  =~# '\s'
"endfunction
"
"" confirm completion
"inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

"=================================================

" vertical split an existing buffer
" :vsp - for current buffer
" :vsp name.txt or buffer number

" close buffer
" :bw - for current buffer
" :bw name.txt or buffer number

"save file
"nnoremap <S-s> :w<cr>

"exit
nnoremap <S-q> :q<cr>

"exit with save
"nnoremap <S-e> :wq<cr>

"reload vimrc
" nnoremap <C-r> :source ~/.config/nvim/init.vim<cr>
