
set nocompatible
filetype off		

set backspace=indent,eol,start 	" allow backspacing over everything in insert mode
set history=50			" keep 50 lines of command line history
set ruler			" show the cursor position all the time
set showcmd			" display incomplete commands
set incsearch			" do incremental searching
set autoindent
set relativenumber
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard=unnamedplus
set pastetoggle=<F2>
set t_ZH=[3m
set t_ZR=[23m

highlight Comment cterm=italic

imap jj <ESC> 
inoremap <C-U> <C-G>u<C-U>
map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>

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
