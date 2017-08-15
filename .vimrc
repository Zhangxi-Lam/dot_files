""""""""""""""""""""
" General
""""""""""""""""""""
" encoding
set encoding=utf8
set ffs=unix,dos,mac

set history=700
set autoread

let mapleader=","
let g:mapleader=","

nnoremap <leader>w :w!<cr>
nnoremap <leader>qq :q<cr>

inoremap jj <ESC>

" cancel highlight, close preview window
nnoremap <silent> <leader><space> :noh<cr>:pc<cr>

" cd to file's base directory
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" space to toggle folding
nnoremap <space> za

" copy all contents
nnoremap <leader>cp mzggyG`z

" paste mode toggle
nnoremap <leader>pp :setlocal paste!<cr>:set relativenumber!<cr>:set nu!<cr>  

" filesytem autocomplete
inoremap <leader>fa <C-x><C-f>

set mouse=a

""""""""""""""""""""
" UI
""""""""""""""""""""
set so=7

set wildmenu
set wildignore=*.o,*~,*.pyc,*.bin,#*#

setlocal keywordprg=:help

set nu
set relativenumber
set hid
set whichwrap+=<,>,h,l
set ruler

" searching
set ignorecase
set smartcase
set hlsearch
set incsearch

" regex
set magic

" paren match
set showmatch

" bells
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" folding
set fdm=syntax
set foldlevel=99

""""""""""""""""""""
" Files, backup and undo 
""""""""""""""""""""
" turn off filetype temporarily
filetype plugin indent off
set nobackup
set nowb
set noswapfile

" customize filetype
augroup set_filetype
    au BufRead,BufNewFile *.h++ setf cpp
    au BufRead,BufNewFile *.c++ setf cpp
augroup END

filetype plugin indent on


""""""""""""""""""""
" Text and tabs
""""""""""""""""""""
set smarttab
set shiftwidth=4
set tabstop=4
set expandtab

set ai "Auto indent
set si "Smart indet

""""""""""""""""""""
" Navigation
""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" Smart way to move between window
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" tab window
nnoremap th <C-Pageup>
nnoremap tl <C-Pagedown>
nnoremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
nnoremap <leader>tm :tabmove<cr>

try
    set switchbuf=useopen,usetab,newtab
        set stal=2
    catch
endtry

" Return to last edit position when opening files
autocmd BufReadPost *
            \ if line("'\"") > 0 && line("'\"") <= line("$") |
            \ exe "normal! g`\"" |
            \ endif
" Remember info about open buffer on close
set viminfo^=%

""""""""""""""""""""
" Spell check
""""""""""""""""""""

" Pressing ,sp will toggle and toggle spell checking
nnoremap <leader>sp :setlocal spell!<cr>

" Shortcuts using <leader>
"  ]s next word
"  [s previous word
"  zg ignore this error
"  z= suggestion

""""""""""""""""""""
" Vundle, Plugin
""""""""""""""""""""


" Vundle
" Brief help
" :BundleList		- list configured bundles
" :BundleInstall(!)	- install(update) bundles
" :BundleSearch(!) foo	- search(or refresh cache first) for foo
" :BundleClean(!)	- confirm(or auto-approve) removal of unused bundles
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Bundle 'Vundlevim/vundle.vim'

" Syntastic
" symatics check
Bundle 'scrooloose/syntastic'
" facility to syntastic, open llist quickly
" <leader>l open llist, <leader>q quit llist
Bundle 'Valloric/ListToggle'

Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
" C/C++ header/source jump
Bundle 'a.vim'
" file finder
Bundle 'kien/ctrlp.vim'
" Vim utilities
Bundle 'L9'
" Statusline utility
Bundle 'Lokaltog/powerline'
" Move around
Bundle 'Lokaltog/vim-easymotion'
" Modify surrounding tag/'/"/(/[, etc.
" example: normal mode, cs({
Bundle 'tpope/vim-surround'
" Auto complete brackets
Bundle 'Raimondi/delimitMate'
Bundle 'Shougo/vimproc'

Bundle 'ervandew/supertab'

Bundle 'scrooloose/nerdtree'
"Bundle 'Valloric/YouCompleteMe'

call vundle#end()

" open NERDTree when vim starts up
autocmd vimenter * :NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif



filetype plugin indent on
syntax on

""""""""""""""""""""
" Colors & Fonts
""""""""""""""""""""
syntax on 

set background=dark

try
    colorscheme desert
catch
endtry

highlight ColorColumn ctermbg=blue guibg=#2c2d27
let &colorcolumn="121"
hi Search ctermbg=yellow ctermfg=black
hi IncSearch ctermbg=yellow ctermfg=black
" Vim utils
""""""""""""""""""""
 
setlocal keywordprg=:help

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


