" fudge's .vimrc

set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set autoindent          " always set autoindenting on
set ruler               " show the cursor position all the time
set showcmd             " display incomplete commands
set incsearch           " do incremental searching

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set ch=2		" Make command line two lines high

set mousehide		" Hide the mouse when typing text

" Make shift-insert work like in Xterm
map <S-Insert> <MiddleMouse>
map! <S-Insert> <MiddleMouse>

" Only do this for Vim version 5.0 and later.
if version >= 500

  " I like highlighting strings inside C comments
  let c_comment_strings=1

  " Switch on syntax highlighting if it wasn't on yet.
  if !exists("syntax_on")
    syntax on
  endif

  " Switch on search pattern highlighting.
  set hlsearch

endif

hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif


" tabs
set ts=4
set sw=4
set nosta
set sts=0
set noet
set softtabstop=4
set expandtab


" indending
"set si

" line numbers
set nu!

" tags
"set tags=/home/frankg/work/sources/aolcs/flapSnac/tags,/usr/java/jdk1.3_002/tags
set tags=~/.tags
set sm
set ai
syntax on
let java_highlight_all=1
let java_highlight_functions="style"
let java_allow_cpp_keywords=1
set complete=.,w,b,u,t,i
"set foldmethod=indent
filetype on

set background=dark
color desert
if has('gui_running')
  "color macvim
  color solarized
  set guifont=Monaco:h9
  set guioptions=egmrt
  set guioptions-=r
endif

" groovy

au BufNewFile,BufRead *.gradle set filetype=groovy
function! RunGroovy()
    let gfname=@%
    botright new
    setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile nowrap
    let gtmpf = tempname()
    let gcmd = ':!groovy ' . gfname . ' > ' . gtmpf
    silent execute gcmd
    silent execute '0r ' . gtmpf
endfunction
map :call RunGroovy()

" pathogen
call pathogen#infect()
filetype plugin indent on

" nerdtree
nmap @ :NERDTree
