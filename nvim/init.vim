" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" call plug#begin('~/.vim/plugged')
call plug#begin('~/.local/share/nvim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

"Plug 'Valloric/YouCompleteMe'

" coc-ultisnips and coc-neosnippet
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'jiangmiao/auto-pairs'
Plug '907th/vim-auto-save'
Plug 'easymotion/vim-easymotion'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale', {'for': 'python'}
Plug 'Yggdroot/indentLine'

"Python
Plug 'Vimjas/vim-python-pep8-indent', {'for': 'python'}
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}

"Themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'joshdick/onedark.vim'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'

" Initialize plugin system
call plug#end()

"==========================================================================

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
set autoindent
set showmatch
set colorcolumn=120
set updatetime=100
set ttyfast
set ttimeout
set ttimeoutlen=50
set backspace=indent,eol,start whichwrap+=<,>,[,]
set showcmd
set wildmenu
set wildmode=longest:full,full
set hidden
set number relativenumber
set laststatus=2
set nowrap
set nopaste

set smartcase
set ignorecase

set hlsearch
set incsearch
set nobackup
set noswapfile
set completeopt-=preview
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

set signcolumn=yes

"--------------------------
" Python
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4 colorcolumn=80
"autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class

let g:python_highlight_all = 1

" semshi
function MyCustomHighlights()
	hi semshiLocal           ctermfg=209 guifg=#ff875f
	hi semshiGlobal          ctermfg=214 guifg=#ffaf00
	hi semshiImported        ctermfg=214 guifg=#deba78 cterm=bold gui=none
	hi semshiParameter       ctermfg=75  guifg=#5fafff
	hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
	hi semshiFree            ctermfg=218 guifg=#ffafd7
	hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
	hi semshiAttribute       ctermfg=49  guifg=#00ffaf
	hi semshiSelf            ctermfg=249 guifg=#deba78
	hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
	hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

	hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
	sign define semshiError text=E> texthl=semshiErrorSign
endfunction
autocmd FileType python call MyCustomHighlights()

"--------------------------

"========================================================================

" autosave
let g:auto_save = 1
let g:auto_save_events = ["InsertLeave", "TextChanged"]
let g:auto_save_silent = 1

"schemes
"set background=dark
colorscheme onedark
colorscheme gruvbox

"example for xfce4-terminal
set termguicolors

"airline-themes
let g:airline_theme='gruvbox'
"let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" indent line
let g:indentLine_color_term = 239
let g:indentLine_char = '▏'

" ale
let b:ale_linters = {'python': ['mypy', 'pylint', 'flake8']}
let g:ale_linters_explicit = 1

"==========================================================================
"mapping

let mapleader="\<Space>"

map <leader>s :NERDTreeToggle<cr>

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

" ultisnips
let g:UltiSnipsExpandTrigger = "<c-j>"

"----------------------------------------------
" coc.nvim

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
		\ pumvisible() ? "\<C-n>" :
		\ <SID>check_back_space() ? "\<TAB>" :
		\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

"----------------------------------------------

"exit
nnoremap <S-q> :q<cr>
