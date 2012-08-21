source $HOME/.vimrc.base

set nobackup
set noexpandtab
set nosmarttab
set tabstop=8
set shiftwidth=8
set softtabstop=0
set number
set hidden
set completeopt=menu,menuone
filetype plugin on
filetype indent on

syntax off

map <TAB> <C-^>
map <C-M> :make -s %:r && ./%:r<CR>
map <F1> :make<CR>
