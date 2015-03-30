set nocompatible
filetype off

if !isdirectory(expand("~/.vim/bundle/Vundle.vim/.git"))
    !git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
endif

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Setup vundle plugins
Plugin 'gmarik/Vundle.vim'
Plugin 'https://github.com/bling/vim-airline.git'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'mileszs/ack.vim'
Plugin 'idanarye/vim-merginal'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-signify'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'taglist.vim'

" THEMES
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'DAddYE/soda.vim'
Plugin 'croaky/vim-colors-github'

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

" Creat backup and tmp directories
" Delete old temp files on start
silent execute '!mkdir -p ~/.vim/temp'
silent execute '!rm -f ~/.vim/temp/*~'
set backupdir=~/.vim/temp
set directory=~/.vim/temp

" Fix Backspace
set backspace=indent,eol,start

set encoding=utf-8
set t_Co=256
set term=xterm-256color
set termencoding=utf-8
set fillchars+=stl:\ ,stlnc:\

set laststatus=2
set showmatch
set ruler
set hlsearch
set incsearch
set noerrorbells
set visualbell
set tabstop=4
set shiftwidth=4
set autoindent
set smartindent
"set noequalalways
set expandtab
set cursorline

set foldlevel=99

set antialias
set linespace=6


if has("gui_running")
    set guifont=Ubuntu\ Mono:h16

    " Hide scrollbars
    set guioptions-=r
    set guioptions-=L

    " Hide GUI tabs
    set guioptions-=e

    " Hide toolbar
    set guioptions-=T

    " Transparency
    set transparency=5

    set background=light
    colorscheme solarized

else
    set background=dark
    colorscheme gruvbox
endif

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<

" KEYMAPS
" -------------------------------------------------------------------------------------------------
" map leader to ,
let mapleader = ","

",w to save
nmap <leader>w :w!<cr>

",t to create a new tab
nmap <leader>t :tabnew<cr>

" ,. to select next tab
nmap <leader>- :tabnext<cr>
nmap <leader>. :bNext<cr>

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

" Pane resize
map <silent> <S-Right> <C-w><
map <silent> <S-Down> <C-W>-
map <silent> <S-Up> <C-W>+
map <silent> <S-Left> <C-w>>

" Switch Panes
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" NERDTree Settings
nnoremap <F1> :set hlsearch!<CR>
map <F2> :set list!<cr>
map <F3> :execute 'NERDTreeToggle ' . getcwd()<cr>
map <F4> :NERDTreeFromBookmark
nnoremap <F5> :TlistToggle<CR>

inoremap <C-z> <C-O>za
nnoremap <C-z> za
onoremap <C-z> <C-C>za
vnoremap <C-z> zf

" Strip whitespace
nnoremap <leader>l :Strip<cr>

" MISC SETTINGS
" -------------------------------------------------------------------------------------------------
" let TagList open on right side
let Tlist_Use_Right_Window   = 1

" Display NERDTree on right side
let g:NERDTreeWinPos = "left"

" let NERDTree ignore som files
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

" Don't collapse NERDTree
let NERDTreeQuitOnOpen=0
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1

" IndentLine
let g:indentLine_char = '︙'

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
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts=0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

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
