
set nocompatible
filetype off		

set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set history=50			" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set autoindent
set relativenumber
set tabstop=2
set shiftwidth=2
set expandtab
set clipboard=unnamedplus
set pastetoggle=<F2>
set t_ZH=[3m
set t_ZR=[23m
set scrolloff=2

highlight Comment cterm=italic

" CUSTOM KEY BINDINGS ---------------------------

" ALTGR d/D as ESC
map ð <ESC> 
map! ð <ESC>
map Ð <ESC>
map! Ð <ESC>
" Kill Caps Lock when leaving insert mode
autocmd InsertLeave * set iminsert=0 

inoremap <C-U> <C-G>u<C-U>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-s> :w<CR>

nnoremap t e
nnoremap T E
nnoremap e b
nnoremap E B

nnoremap U J
nnoremap J L
nnoremap K H
nnoremap H ^
nnoremap L $

noremap K :call Hcontext()<CR>
noremap J :call Lcontext()<CR>

func! Hcontext()
  if (winline() == &so+1 && line(".") != 1)
    exe "normal! \<PageUp>H"
  else
    exe "normal! H"
  endif
  echo ''
endfunc

func! Lcontext()
  if (winline() == winheight(0)-&so && line(".") != line("$"))
    exe "normal! \<PageDown>L"
  else
    exe "normal! L"
  endif
    echo ''
endfunc


if has('mouse')
  set mouse=a
endif

if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
  Plugin 'VundleVim/Vundle.vim'
  Plugin 'tpope/vim-fugitive'
  Plugin 'scrooloose/nerdTree'
  Plugin 'flazz/vim-colorschemes'
  " Plugin 'Valloric/YouCompleteMe'
  " Plugin 'L9'
  " Plugin 'git://git.wincent.com/command-t.git'  " Git plugin not hosted on GitHub
  " Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
call vundle#end()
filetype plugin indent on 

syntax enable
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1 
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
set bg=dark

autocmd VimEnter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


