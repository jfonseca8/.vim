" Jersey Fonseca's vimrc
" Last updated: June 30, 2020


" =============== PLUGINS =============== "

" Make plugin directory if it's not there
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -flo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd vimenter * pluginstall --sync | source $myvimrc
endif


" Install plugins
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'               " show file directory
Plug 'itchyny/lightline.vim'            " light vim line
Plug 'vuciv/vim-bujo'                   " task manager
Plug 'morhetz/gruvbox'                  " color scheme
Plug 'vimwiki/vimwiki'                  " personal wiki
call plug#end()


" =============== GENERAL =============== "

set number                 " see numberlines
set showcmd                " see last command
filetype plugin indent on  " spec indent files, filetype tracking
set showmatch              " set parens to match each other
set incsearch              " search as characters are entered

" tab config
set tabstop=2
set softtabstop=2   
set shiftwidth=2
set expandtab
retab


" =============== COLORSCHEME =============== "

syntax enable
set background=dark
colorscheme gruvbox 


" =============== MISCELLANEOUS =============== "

command! Tags !ctags -R . " create tags
set path+=**              " search all subfolders

" highlight text over 80 characters as red
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Automatically finish brackets and quotes
inoremap " ""<left>
inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O


" =============== WINDOW MAPPINGS =============== "

nnoremap <C-Right> <C-w>v<C-w><Right> " Open & go to vert window
nnoremap <C-Down> <C-w>S<C-w><Down>   " Open & go to horiz window
nnoremap <C-Up> <C-w>o                " Close all windows except current
nnoremap <Right> <C-w><Right>         " Go to right window
nnoremap <Left> <C-w><Left>           " Go to up window
nnoremap <Up> <C-w><Up>               " Go to left window
nnoremap <Down> <C-w><Down>           " Go to down window


" =============== BUJO COMMANDS =============== "

nmap <C-Enter> <Plug>BujoAddnormal
imap <C-Enter> <Plug>BujoAddinsert
nmap <C-BS> <Plug>BujoChecknormal
imap <C-BS> <Plug>BujoCheckinsert


" =============== SAVE/QUIT =============== "

nmap <C-S> :w<Enter>
imap <C-S> <esc>:w<Enter>a
nmap <C-Q> :q<Enter> 
imap <C-Q> <esc>:q<Enter> 


" =============== LIGHTLINE =============== "

set laststatus=2
set noshowmode
let g:lightline = {'colorscheme' : 'solarized'}


" =============== VIMWIKI =============== "

let g:vimwiki_list = [{
  \ 'auto_export': 1,
  \ 'automatic_nested_syntaxes':1,
  \ 'path_html': '$HOME/vimwiki/site',
  \ 'path': '$HOME/vimwiki/content',
  \}]


" =============== COMMENTING =============== "

" Automatically generate function header "
function FileHeading()
  let s:line=line(".")
  call setline(s:line,"/* Function - ")
  call append(s:line," *")
  call append(s:line+1," * Purpose - ")
  call append(s:line+2," */")
  unlet s:line
endfunction

imap <silent> <F2> <Esc>mz:execute FileHeading()<CR>`zA
nmap <silent> <F2> mz:execute FileHeading()<CR>`zA