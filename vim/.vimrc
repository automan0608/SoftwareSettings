set cursorline
set number
set wildmenu " vim 自身命令行自动补全
set autoread
set laststatus=2
set ruler
set hlsearch
set incsearch
set ignorecase
set backspace=2

set exrc
set secure

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

set colorcolumn=110 
set nowrap

" use syntax to fold
set foldmethod=syntax
" disable when start vim
" set nofoldenable

" 开启语法检测
syntax enable
syntax on

" 重新打开，光标上一次位置
if has("autocmd")
      au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

"autocmd BufWritePost $MYVIMRC source $MYVIMRC

let mapleader=","

nmap <Leader>p "+p
nmap <Leader>y "+y

" powerline related settings
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" plugin related settings, use vundle to manager all plugins
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
"Plugin 'powerline/powerline'
"Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octal/vim-cpp-enhanced-highlight'
Plugin 'fatih/vim-go'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'kshenoy/vim-signature'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'scrooloose/nerdtree'
call vundle#end()
" open file type detect
filetype on
" use different plugins according to detected file type
filetype plugin indent on

" vim-cpp-enhanced-highlight related settings
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

" vim-indent-guides related settings
let g:indent_guides_enable_on_startup=1
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1
nmap <silent> <Leader>i <Plugin>IndentGuidesToggle

" vim-fswitch related settings
au! BufEnter *.cc let b:fswitchdst  = 'h'
"au! BufEnter *.cc let b:fswitchlocs = './,reg:/src/include/,reg:|src|include/**|,../include'
au! BufEnter *.h  let b:fswitchdst  = 'cc,cpp,c'
"au! BufEnter *.h  let b:fswitchlocs = './,reg:/include/src/,reg:/include.*/src/,../src'
nmap <silent> <Leader>sw :FSHere<cr>

" fzf related settings
nnoremap <silent> <Leader>f :Files<CR>
nnoremap <silent> <Leader>b :Buffers<CR>

" tagbar related settings
let tagbar_left=1
nnoremap <Leader>tag :TagbarToggle<CR>
autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()
let tagbar_width=32
let g:tagbar_compact=0
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
\ }

" nerdtree related settings
nmap <Leader>fl :NERDTreeToggle<CR>
let NERDTreeWinSize=32
let NERDTreeWinPos="right"
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let NERDTreeAutoDeleteBuffer=1

" man related settings
source $VIMRUNTIME/ftplugin/man.vim
nmap <Leader>man :Man 3 <cword><CR>

set background=dark
"colorscheme molokai
colorscheme solarized

