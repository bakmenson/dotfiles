call plug#begin('~/.local/share/nvim/plugged')
" zo： Open fold in current cursor postion
" zO： Open fold and sub-fold in current cursor postion recursively
" zc： Close the fold in current cursor position
" zC： Close the fold and sub-fold in current cursor position recursively
Plug 'tmhedberg/SimpylFold'

Plug 'preservim/nerdcommenter'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Common
Plug 'easymotion/vim-easymotion'
Plug 'jiangmiao/auto-pairs'
Plug 'voldikss/vim-floaterm'
Plug 'mhinz/vim-startify'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'Xuyuanp/nerdtree-git-plugin'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'Luxed/ayu-vim'

call plug#end()
