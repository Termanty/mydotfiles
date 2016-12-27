
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

" Hack to get alt-keys work
" http://stackoverflow.com/questions/6778961/alt-key-shortcuts-not-working-on-gnome-terminal-with-vim
let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw
set timeout ttimeoutlen=20

" Miscelanous
inoremap <C-U> <C-G>u<C-U>
map  <C-s> :w<CR>
nnoremap U J
nnoremap <A-u> g~ib

" Cursor movements
nnoremap t e
nnoremap T E
nnoremap e b
nnoremap E B
nnoremap H ^
nnoremap L $
nnoremap J L
nnoremap K H

" Move line(s) up and down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <esc>:m .+1<CR>==gi
inoremap <A-k> <esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Scroll page up and down
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


" END key bindings -------------------------------------------



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


