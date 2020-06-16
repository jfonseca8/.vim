" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'morhetz/gruvbox'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax on
colorscheme gruvbox  " cool color scheme
let g:gruvbox_contrast_dark = 'hard'
:set bg=dark
set termguicolors

set tabstop=4
set softtabstop=4   " spaces when editing
set shiftwidth=4
set expandtab
retab

set number          " see numberlines

set showcmd         " see last command

set cursorline      " see cursorline

filetype indent on  " spec indent files, filetype tracking

set showmatch       " set parens to match each other

set incsearch           " search as characters are entered
set hlsearch            " highlight matches


filetype plugin indent on
syntax on
