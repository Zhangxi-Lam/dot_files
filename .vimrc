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
nnoremap <leader>w :q<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>qq :q!<cr>
nnoremap <leader>qa :qall<cr>

inoremap jj <ESC>

" cancel highlight, close preview window
nnoremap <silent> <leader>, :noh<cr>:pc<cr>

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

set clipboard=unnamed

nnoremap <leader>fv :silent tabedit ~/.vimrc<cr>
nnoremap <leader>fz :silent tabedit ~/.zshrc<cr>
nnoremap <leader>ff /

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
set shiftwidth=2
set tabstop=2
set expandtab

set ai "Auto indent
set si "Smart indet

""""""""""""""""""""
" Navigation
""""""""""""""""""""
nnoremap j gj
nnoremap k gk

" Smart way to move between window
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>r <C-w>r
nnoremap <leader>x <C-w>x


" tab window
nnoremap <leader>th <C-Pageup>
nnoremap <leader>tl <C-Pagedown>
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
nnoremap <C-s> :setlocal spell!<cr>

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
let g:gitgutter_map_keys = 0
" C/C++ header/source jump
" Plugin 'a.vim'
" file finder
Plugin 'kien/ctrlp.vim'
" Vim utilities
Plugin 'L9'
" Statusline utility
Plugin 'Lokaltog/vim-powerline'
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
Plugin 'scrooloose/nerdcommenter'

" Split mo
Plugin 'bkad/CamelCaseMotion'

" C/C++ auto completion
"Plugin 'justmao945/vim-clang'

" Google AutoFormat
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'

Plugin 'editorconfig/editorconfig-vim'

Plugin 'Shougo/unite.vim'

Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'

Plugin 'Shougo/echodoc'

Plugin 'octol/vim-cpp-enhanced-highlight'

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

call vundle#end()

filetype plugin indent on
syntax on

" powerline
set laststatus=2
" Echodoc
set cmdheight=2
autocmd bufenter * :EchoDocEnable

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
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" git-fugitive
nnoremap <leader>gtd :Gdiff<cr>
nnoremap <leader>gts :Gstatus<cr>

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

" vimshell
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
    au BufWritePre *.c,*.cpp,*.py,*.java,*.html :FormatLines
catch
endtry

" YouCompleteMe
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gf :YcmCompleter GoToDefinition<CR>
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nmap <leader>yd :YcmDiags<CR>

" NerdComment
let g:NERDCreateDefaultMappings = 0
map <leader>/ :call NERDComment(0,"toggle")<cr>


""""""""""""""""""""
" Colors & Fonts
""""""""""""""""""""
set background=dark

try
    colorscheme desert
catch
endtry

highlight ColorColumn ctermbg=blue guibg=#2c2d27
let &colorcolumn="81"
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

""""""""""""""""""""
" Cscope
""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"
" This file contains some boilerplate settings for vim's cscope interface,
" plus some keyboard mappings that I've found useful.
"
" USAGE:
" -- vim 6:     Stick this file in your ~/.vim/plugin directory (or in a
"               'plugin' directory in some other directory that is in your
"               'runtimepath'.
"
" -- vim 5:     Stick this file somewhere and 'source cscope.vim' it from
"               your ~/.vimrc file (or cut and paste it into your .vimrc).
"
" NOTE:
" These key maps use multiple keystrokes (2 or 3 keys).  If you find that vim
" keeps timing you out before you can complete them, try changing your timeout
" settings, as explained below.
"
" Happy cscoping,
"
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim...
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add the database pointed to by environment variable
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "
    
    " To do the first type of search, hit 'CTRL-\', followed by one of the
    " cscope search types above (s,g,c,t,e,f,i,d).  The result of your cscope
    " search will be displayed in the current window.  You can use CTRL-T to
    " go back to where you were before the search.
    "

    "   's'   symbol: find all references to the token under cursor
    nmap <leader>gs :cs find s <C-R>=expand("<cword>")<CR><CR>
    "   'g'   global: find global definition(s) of the token under cursor
    nmap <leader>gg :cs find g <C-R>=expand("<cword>")<CR><CR>
    "   'c'   calls:  find all calls to the function name under cursor
    nmap <leader>gc :cs find c <C-R>=expand("<cword>")<CR><CR>
    "   't'   text:   find all instances of the text under cursor
    nmap <leader>gt :cs find t <C-R>=expand("<cword>")<CR><CR>
    "   'e'   egrep:  egrep search for the word under cursor
    nmap <leader>ge :cs find e <C-R>=expand("<cword>")<CR><CR>
    "   'd'   called: find functions that function under cursor calls
    "nmap <leader>gd :cs find d <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>


    " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
    " makes the vim window split horizontally, with search result displayed in
    " the new window.
    "
    " (Note: earlier versions of vim may not have the :scs command, but it
    " can be simulated roughly via:
    "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

    "nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one (vim 6 and up only)
    "
    " (Note: you may wish to put a 'set splitright' in your .vimrc
    " if you prefer the new window on the right instead of the left

    "nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    "nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
    "nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    "nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100
endif


