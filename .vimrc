" be iMproved, required
set nocompatible

"vundle required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Setup vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic.git'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'idanarye/vim-merginal'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'jmcantrell/vim-virtualenv'

" THEMES
Plugin 'morhetz/gruvbox'

" End Vundle
call vundle#end()
filetype plugin on
filetype plugin indent on


" GENERAL SETTINGS
" -------------------------------------------------------------------------------------------------
" Set syntax highlighting on
syntax on

set mouse=a                         " Enable mouse
set number
set backup
set directory=~/.vim/tmp
set backupdir=~/.vim/backup
"set noshowcmd
set showmatch
"set noshowmode                      " Don't show current mode
set ruler
set hlsearch
set incsearch
"set noerrorbells
"set visualbell
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"set noequalalways
set expandtab
set cursorline

set foldlevel=99

set antialias
set background=dark
colorscheme gruvbox
set linespace=6

if has("gui_running")
    " set guifont=Input\ Mono\ Narrow:h14
    set guifont=Ubuntu\ Mono:h16

    " Hide scrollbars
    set guioptions-=r
    set guioptions-=L

    " Hide GUI tabs
    set guioptions-=e

    " Hide toolbar
    set guioptions-=T

    " Transparency
    set transparency=20
endif

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" KEYMAPS
" -------------------------------------------------------------------------------------------------
" map leader to ,
let mapleader = ","

",w to save
nmap <leader>w :w!<cr>

" ,. to select next tab
nmap <leader>. :tabnext<cr>

" use jj to return to normal mode
imap jj <Esc>

" Use Shift Tab to unindent
" inoremap <S-Tab> <C-d>
nmap <Tab> a<C-t><Esc>
nmap <S-Tab> a<C-d><Esc>
" imap <C-Tab> <C-t>
imap <S-Tab> <C-d>

vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv
" vmap <S-Tab> <
" vmap <Tab> >

" Search with Ack
nmap <leader>a <Esc>:Ack!

" NERDTree Settings
nnoremap <F1> :set hlsearch!<CR>
map <F2> :set list!<cr>
map <F3> :execute 'NERDTreeToggle ' . getcwd()<cr>
map <F4> :NERDTreeFromBookmark

inoremap <F5> <C-O>za
nnoremap <F5> za
onoremap <F5> <C-C>za
vnoremap <F5> zf

" Strip whitespace
nnoremap <leader>l :Strip<cr>

" MISC SETTINGS
" -------------------------------------------------------------------------------------------------
" let NERDTree ignore som files
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

" Don't collapse NERDTree
let NERDTreeQuitOnOpen=0
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1

" Display NERDTree on right side
let g:NERDTreeWinPos = "right"

" CoffeeScript linter and Watcher settings
let coffee_compile_vert = 1
let coffee_watch_vert = 1

" Set path to coffeelinter
let coffee_linter = '/usr/local/bin/coffeelint'

" Set linter options
" ------------------------------------------
let g:syntastic_python_checkers = ['pylint']
" let g:syntastic_python_pylint_args = "--"

" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

" Vim Airline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/

" Strip whitespace
function! StripWhitespace()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun

command! Strip call StripWhitespace()<cr>

" Remember last location in file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal g'\"" | endif
endif

" Set tab size to 2 when editing Coffee-Script Files
au BufNewFile,BufReadPost *.coffee setl shiftwidth=2 tabstop=2 expandtab

" Setup indent based folding
augroup vimrc
  au BufReadPre * setlocal foldmethod=indent
  au BufWinEnter * if &fdm == 'indent' | setlocal foldmethod=manual | endif
augroup END

" Use The Silver Searcher if available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" AutoClose
autocmd CompleteDone * pclose