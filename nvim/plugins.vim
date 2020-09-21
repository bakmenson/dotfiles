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
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'jiangmiao/auto-pairs'
"Plug 'Yggdroot/indentLine'
Plug 'liuchengxu/vim-which-key'
Plug 'voldikss/vim-floaterm'

Plug 'norcalli/nvim-colorizer.lua'

Plug 'mhinz/vim-startify'

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
