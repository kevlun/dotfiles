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
Plugin 'taglist.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/neocomplete.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'Lokaltog/vim-easymotion'

" THEMES
Plugin 'morhetz/gruvbox'
Plugin 'altercation/vim-colors-solarized'
Plugin 'DAddYE/soda.vim'
Plugin 'croaky/vim-colors-github'
Plugin 'sickill/vim-monokai'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'w0ng/vim-hybrid'
Plugin 'zeis/vim-kolor'
Plugin 'notpratheek/vim-luna'
Plugin 'zenorocha/dracula-theme', {'rtp': 'vim/'}

" End Vundle
call vundle#end()
filetype plugin on
filetype plugin indent on


" GENERAL SETTINGS
" -------------------------------------------------------------------------------------------------
" Set syntax highlighting on
syntax on

set mouse=a                         " Enable mouse
set relativenumber
set number
set shell=/bin/bash\ -li

" Disable Backup
" -------------------------------------
set nobackup
set noswapfile
set nowritebackup

" Enable Backup
" -------------------------------------
"set backup
" Creat backup and tmp directories
" Delete old temp files on start
"silent execute '!mkdir -p ~/.vim/temp'
"silent execute '!rm -f ~/.vim/temp/*~'
"set backupdir=~/.vim/temp
"set directory=~/.vim/temp
" -------------------------------------

" Fix Backspace
set backspace=indent,eol,start
set encoding=utf-8
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
set expandtab
set cursorline
set foldlevel=99
set antialias
set linespace=6
set noequalalways

" Theme settings
set background=dark
colorscheme hybrid

if has("gui_running")
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h16

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
    "hi Normal ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=#282a36 gui=NONE

else
    set t_Co=256
    set term=xterm-256color
    set termencoding=utf-8
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
nmap <leader>- :bn<cr>
nmap <leader>. :bp<cr>

" use jj to return to normal mode
imap jj <Esc>

" Use Shift Tab to unindent
" inoremap <S-Tab> <C-d>
nmap <Tab> a<C-t><Esc>
nmap <S-Tab> a<C-d><Esc>
"imap <Tab> <C-t>
imap <S-Tab> <C-d>
vmap <Tab> :><CR>gv
vmap <S-Tab> :<<CR>gv

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
map <F4> :NERDTree .<cr>
"map <F4> :NERDTreeFromBookmark
nnoremap <F5> :TlistToggle<CR>

inoremap <C-z> <C-O>za
nnoremap <C-z> za
onoremap <C-z> <C-C>za
vnoremap <C-z> zf

" Strip whitespace
nnoremap <leader>l :Strip<cr>

" CTRL-P
nnoremap <Leader>o :execute 'CtrlP ' . getcwd()<cr>
nnoremap <Leader>r :CtrlPMRU<cr>
nnoremap <Leader>b :CtrlPBuffer<cr>

" EasyMotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" MISC SETTINGS
" -------------------------------------------------------------------------------------------------
" let TagList open on right side
let Tlist_Use_Right_Window   = 1

" Change Directory to Project directory
"if isdirectory(expand("~/Projects"))
    "cd ~/Projects
"endif

" Display NERDTree on right side
let g:NERDTreeWinPos = "left"

" let NERDTree ignore som files
let NERDTreeIgnore=['\.pyc$', '\~$', '__pycache__']

" Don't collapse NERDTree
let NERDTreeQuitOnOpen=0
let NERDTreeDirArrows=1
let NERDTreeMinimalUI=1
let NERDTreeChDirMode=2

let g:NERDTreeIndicatorMap = {
    \ "Modified"  : "~",
    \ "Staged"    : "+",
    \ "Untracked" : "+",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "X",
    \ "Dirty"     : "~",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" CoffeeScript linter and Watcher settings
let coffee_compile_vert = 1
let coffee_watch_vert = 1

" Set path to coffeelinter
let coffee_linter = '/usr/local/bin/coffeelint'

" Set CTRL-P Options
if exists("g:ctrl_user_command")
    unlet g:ctrlp_user_command
endif

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

let g:ctrlp_custom_ignore='\v[\/](node_modules|env)|(\.(swp|ico|git|svn|hg|pyc))$'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=0
let g:ctrlp_clear_cache_on_exit=0
let g:ctrlp_switch_buffer = 'E'

let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

" Syntastice Linter Options
" -------------------------------------------------------------------------------------------------
" Better :sign interface symbols
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '!'

let g:syntastic_enable_highlighting=1
let g:syntastic_enable_signs=0
let g:syntastic_enable_balloons=1
let g:syntastic_python_checkers = ['pylint']

let g:syntastic_php_phpcs_args="--report=csv --standard=PSR2"
" let g:syntastic_python_pylint_args = "--"

" Disable syntax checking for python files (python-mode)
"let g:pymode_lint_write = 0

"autocmd FileType python let g:syntastic_check_on_wq = 0

" Vim Airline settings
" -------------------------------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

let g:airline_powerline_fonts=1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.whitespace = 'Ξ'

" NeoComplete settings
" -------------------------------------------------------------------------------------------------

"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'

" change cursor shape between insert and normal mode in iTerm2.app
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

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

" AutoClose
autocmd CompleteDone * pclose
