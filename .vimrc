""""""""""""""""""""
" General
""""""""""""""""""""
" encoding
set encoding=utf8
set ffs=unix,dos,mac

set history=700

let mapleader=" "
let g:mapleader=" "

nnoremap <leader>s :w!<cr>
nnoremap <leader>qq :q<cr>
nnoremap <leader>qa :qall<cr>

inoremap jj <ESC>

" cancel highlight, close preview window
nnoremap <silent> <leader><space> :noh<cr>:pc<cr>

" cd to file's base directory
nnoremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" space to toggle folding
nnoremap <leader>zz za

" copy all contents
nnoremap <leader>a mzggyG`z

" paste mode toggle
nnoremap <leader>c :setlocal paste!<cr>:set relativenumber!<cr>:set nu!<cr>

" filesytem autocomplete
inoremap ,f <C-x><C-f>

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
set backspace=eol,start,indent
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
" :PluginList       - list configured bundles
" :PluginInstall(!) - install(update) bundles
" :PluginSearch(!) foo  - search(or refresh cache first) for foo
" :PluginClean(!)   - confirm(or auto-approve) removal of unused bundles
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()
Plugin 'Vundlevim/vundle.vim'

" Syntastic
" symatics check
Plugin 'scrooloose/syntastic'
" facility to syntastic, open llist quickly
" <leader>l open llist, <leader>q quit llist
Plugin 'Valloric/ListToggle'
let g:lt_location_list_toggle_map = '<leader>wl'
let g:lt_quickfix_list_toggle_map = '<leader>wq'

Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
" C/C++ header/source jump
" Plugin 'a.vim'
" file finder
Plugin 'kien/ctrlp.vim'
" Vim utilities
Plugin 'L9'
" Statusline utility
Plugin 'Lokaltog/powerline'
" Move around
Plugin 'Lokaltog/vim-easymotion'
" Modify surrounding tag/'/"/(/[, etc.
" example: normal mode, cs({
Plugin 'tpope/vim-surround'
" Auto complete brackets
Plugin 'Raimondi/delimitMate'
Plugin 'Shougo/vimproc'

" Use tab for completion
Plugin 'ervandew/supertab'

" FileTree
Plugin 'scrooloose/nerdtree'

" Split mo
Plugin 'bkad/CamelCaseMotion'

" C/C++ auto completion
Plugin 'justmao945/vim-clang'

" Google AutoFormat
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'Lokaltog/vim-powerline'

Plugin 'Shougo/unite.vim'

"Plugin 'Valloric/YouCompleteMe'
"Plugin 'rdnetto/YCM-Generator'

Plugin 'Shougo/vimshell'

call vundle#end()

filetype plugin indent on
syntax on

" CamelCaseMotion
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
map <silent> ge <Plug>CamelCaseMotion_ge
sunmap w
sunmap b
sunmap e
sunmap ge

" open NERDTree when vim starts up
autocmd vimenter * :NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" git-fugitive
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>

" a.vim
" try
"     iunmap <leader>ih
"     iunmap <leader>is
"     iunmap <leader>ihn
" catch
" endtry

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:vimshell_external_history_path = expand('~/.zsh-history')


" Google AutoFormat
augroup autoformat_settings
    autocmd FileType bzl AutoFormatBuffer buildifier
    autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
    autocmd FileType dart AutoFormatBuffer dartfmt
    autocmd FileType go AutoFormatBuffer gofmt
    autocmd FileType gn AutoFormatBuffer gn
    autocmd FileType html,css,json AutoFormatBuffer js-beautify
    autocmd FileType java AutoFormatBuffer google-java-format
    autocmd FileType python AutoFormatBuffer yapf
    " Alternative: autocmd FileType python AutoFormatBuffer autopep8
augroup END

try
    au BufWritePre * :FormatLines
catch
endtry

" VimShell
let g:vimshell_user_prompt = 'fnamemodify(getcwd(), ":~")'
let g:vimshell_prompt = '$ '
nnoremap <leader>t :VimShellPop <CR>
" Make shell window show below the current window.
set splitbelow


""""""""""""""""""""
" Colors & Fonts
""""""""""""""""""""
set background=dark

try
    colorscheme desert
catch
endtry

highlight ColorColumn ctermbg=blue guibg=#2c2d27
let &colorcolumn="121"
hi Search ctermbg=yellow ctermfg=black
hi IncSearch ctermbg=yellow ctermfg=black
highlight ExtraWhitespace ctermbg=red guibg=red

""""""""""""""""""""
" Vim utils
""""""""""""""""""""

setlocal keywordprg=:help

augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END


