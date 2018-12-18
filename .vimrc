" set color scheme
colorscheme ron
" enable syntax highlighting
syntax on

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab


execute pathogen#infect()

" set TERM in vim, allowing ctrl+arrow to move cursor instead of delete
set term=xterm-256color

