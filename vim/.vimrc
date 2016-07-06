set background=dark
set smarttab
set expandtab
set laststatus=2

set shiftwidth=4
set tabstop=4

set ignorecase
set smartcase

set showmatch
set mat=2

set autoread

set nu
set cursorline

syntax enable
syntax on
colorscheme desert

let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

let g:winManagerWindowLayout='FileExplorer|TagList'

filetype plugin indent on
set completeopt=longest,menu

map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

let g:SuperTabDefaultCompletionType="context"
