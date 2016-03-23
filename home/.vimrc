set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.homesick/repos/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')
"
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
"Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'bling/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Valloric/YouCompleteMe'
Plugin 'bkad/CamelCaseMotion'
Plugin 'luochen1990/rainbow'
Plugin 'airblade/vim-gitgutter'
"Plugin 'sheerun/vim-polyglot'
Plugin 'xolox/vim-session'
Plugin 'xolox/vim-misc'
Plugin 'kien/ctrlp.vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'tpope/vim-surround'

"COLOR SCHEMES
"Plugin 'altercation/vim-colors-solarized'
"colorscheme solarized
colorscheme default

" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
" Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"GENERAL SETTINGS
autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab
autocmd Filetype coffee setlocal ts=2 sw=2 expandtab
set ts=2 sw=2 expandtab  " Default tabs to 4
set numberwidth=5   " 5 cols wide for line numbers (includes space, not fixed width)
set history=1000
set matchtime=10
set wmh=0           " set min number of lines for any window
set bs=2
set scrolloff=5     " Try to show lines around the curent line for context
set mouse=a         " Enable mouse usage (all modes) in terminals
set tabpagemax=30   " Max number of tabs to open when starting vim
set clipboard=unnamed " Make clipboard work with all operations
set iskeyword+=-   " Add the '-' as a word boundry
set hlsearch        " set highlightseaarch
set smarttab
set expandtab       " tabs turn into spaces
set shiftround      " When indenting do it better
set title
set nopi            " set no preview indent
set ai
set si              " Smart indent.
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set ignorecase      " Do case insensitive matching
set smartcase       " Do smart case matching
set incsearch       " Incremental search
set ruler
set nobackup
set noswapfile
syntax enable
set background=dark
"set gdefault        " set /g on seach/replace
"set autowrite      " Automatically save before commands like :next and :make
set hidden         " Hide buffers when they are abandoned
set cursorline


" Keep the undo history
set undodir=~/.vim/undo " where to save undo histories
set undofile               " Save undo's after file closes
set undolevels=1000        " How many undos
set undoreload=10000       " number of lines to save for undo

highlight Todo          ctermbg=DarkCyan ctermfg=Yellow
highlight BadWhitespace ctermbg=red guibg=red
highlight SignColumn    ctermbg=None
highlight clear CursorLine
highlight CursorLine    ctermbg=234
highlight CursorLineNR  ctermbg=235

let mapleader = ','

"KEYMAPS
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Right> <NOP>
noremap <Left> <NOP>
" Move by screen lines not buffer lines
"nmap <Down> gj
"vmap <Down> gj
"imap <Down> <C-O>gj
" 
"nmap <Up> gk
"vmap <Up> gk
"imap <Up> <C-O>gk
 

if &term =~ '^screen'
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif

" Automatic indenting makes X copy-and-paste untenable so it's useful
" to have a key which will enable/disable it for pasting. You can set
" this with pastetoggle
" nmap <F9> :Set invnumber<CR>
set pastetoggle=<F10>
 
nnoremap <F3> :lne<CR>
nnoremap O1;2R<S-F3> :lprev<CR>
 
" Yank to end of Line - mimic D
nmap Y y$
 
" This will prevent vim from dedenting # comments
" inoremap # X#
 
" Map something to mirror <C-]>
" M - Alt/Meta key
nnoremap <M-]> :pop<CR>
" Holy Crap!  Open <C-]> in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" Don't clobber the unnamed register when pasting over text in visual mode
vnoremap p pgvy

" Take a Visual Selection and replace it with something globally confirm
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>
 
" Make . work with visual selections
vnoremap . :norm.<CR>
 
" Join lines and restore cursor location (J)
nnoremap J mjJ`j
 
" Split the Line at Cursor
nnoremap K i<cr><esc><right>
 
" Tab Section
"nnoremap <C-T> :tabnew<CR>
"nnoremap <S-Right> :tabnext<CR>
"nnoremap <S-Left> :tabprevious<CR>
"nnoremap th  :tabprevious<CR>
"nnoremap tk  :tabfirst<CR>
"nnoremap tj  :tablast<CR>
"nnoremap tl  :tabnext<CR>
"nnoremap tt  :tabedit<Space>
"nnoremap tn  :tabnext<Space>
"nnoremap tm  :tabm<Space>
"nnoremap tml :tabm<Space>+1<CR>
"nnoremap tmh :tabm<Space>-1<CR>
"nnoremap td  :tabclose<CR>
"nnoremap to  :tabo<CR>

" Buffer Section
nnoremap <leader>b :buffers<CR>
nnoremap <leader>. :e#<CR>
nnoremap <leader>d :bdelete<CR>
nnoremap <leader>t :enew<CR>

nnoremap <leader>vs :vs<CR>
nnoremap <leader>sp :split<CR>
 
" Visually Select by Words like windoze
imap <C-S-Right> <C-O>w
vmap <C-S-Right> w
nmap <C-S-Right> vw
 
imap <C-S-Left> <C-O>b
vmap <C-S-Left> b
nmap <C-S-Left> vb
 
" Move the cursor words with the control arrow like other Text Editors
map <C-Right> w
map <C-Left> b
 
" Leave Insert mode
inoremap jk <C-[>
inoremap kj <C-[>

" Pane Navigation
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

"NERDTREE
nmap <silent> <c-n> :NERDTreeToggle<CR>
" Show bookmarks
let NERDTreeShowBookmarks=1
" Don't reset the Tree to base dir
let NERDTreeKeepTreeInNewTab=1

"POWERLINE
set guifont=Source\ Code\ Pro\ for\ Powerline:h18
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
"set term=xterm-256color
let g:solarized_termcolors=256
set termencoding=utf-8

"STATUSLINE
set laststatus=2

" SYNTASTIC
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"AIRLINE
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers=2
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#buffer_idx_mode = 1
  nmap <leader>1 <Plug>AirlineSelectTab1
  nmap <leader>2 <Plug>AirlineSelectTab2
  nmap <leader>3 <Plug>AirlineSelectTab3
  nmap <leader>4 <Plug>AirlineSelectTab4
  nmap <leader>5 <Plug>AirlineSelectTab5
  nmap <leader>6 <Plug>AirlineSelectTab6
  nmap <leader>7 <Plug>AirlineSelectTab7
  nmap <leader>8 <Plug>AirlineSelectTab8
  nmap <leader>9 <Plug>AirlineSelectTab9
  nmap <leader>- <Plug>AirlineSelectPrevTab
  nmap <leader>+ <Plug>AirlineSelectNextTab

" camelCASE Plugin
map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
sunmap w
sunmap b
sunmap e
  
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" Rainbow Parentheses
let g:rainbow_active = 1

let g:rainbow_conf = {
    \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
    \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
    \   'operators': '_,_',
    \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
    \   'separately': {
    \       '*': {},
    \       'tex': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
    \       },
    \       'lisp': {
    \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
    \       },
    \       'vim': {
    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
    \       },
    \       'html': {
    \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
    \       },
    \       'css': 0,
    \   }
    \}

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_auto_colors = 0
highlight IndentGuidesOdd   guibg=red     ctermbg=236
highlight IndentGuidesEven  guibg=green ctermbg=235
 
" snippets
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"
let g:UltiSnipsEditSplit="vertical"
 
" Syntastic
let g:syntastic_check_on_open=1 " Load when opening a file
let g:syntastic_enable_signs=1 " Show signs on Error Lines
let g:syntastic_auto_loc_list=1 " Auto Open/Close Location List
let g:syntastic_enable_balloons=1 " add tooltip balloons to lines
let g:syntastic_enable_highlighting=1 " show highlighting on error line
let g:syntastic_auto_jump=0 " Jump to Errors
let g:syntastic_javascript_checkers=['jshint']
let g:syntastic_php_checkers=['php']
let g:syntastic_css_checkers=['']
let g:syntastic_quiet_messages = {'level': 'warnings'}
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol='☒'
let g:syntastic_style_warning_symbol='⍄'
let g:syntastic_quiet_messages = {'level': 'warnings'}
"let g:syntastic_phpcs_conf="--standard=/home/rwalsh/saru_emt_web/phpcs.xml"
"let g:syntastic_phpcs_conf="--standard=PSR2"

" Session
let g:session_directory = "~/.vim/sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>os :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

" CtrlP - ctrlp
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  "let g:ctrlp_working_path_mode = 'c'
  let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" 03 - FUNCTIONS ===========================================
 
" Allow for copy and paste to/from terminal clipboard
nnoremap <F9> :call ToggleMouse()<CR>
function! ToggleMouse()
  if &mouse == 'a'
    set mouse=v
    set nonu
    set nornu
    echo "Mouse usage Visual"
  else
    set mouse=a
    set nu
    set rnu
    echo "Mouse usage All"
  endif
  execute "GitGutterToggle"
endfunction
 
" Toggle Line Numbers
" Default to have both on
set number          " turn on line numbers
set relativenumber  " turn on relative line numbers too
map <silent> <F8> :call ToggleLN()<cr>
function! ToggleLN()
    if (&nu == 1)
        set rnu
        set nonu
    elseif (&rnu == 1)
        set nornu
        set nonu
    elseif (&rnu == 0 && &nu == 0)
        set rnu
        set nu
    else
        set nornu
        set nonu
    endif
endfunction
 
" Fix keycodes
map [1~ <Home>
map [4~ <End>
imap [1~ <Home>
imap [4~ <End>
 
function! SmartHome()
  let s:col = col(".")
  normal! ^
  if s:col == col(".")
    normal! 0
  endif
endfunction
nnoremap <silent> <Home> :call SmartHome()<CR>
vnoremap <silent> <Home> :call SmartHome()<CR>
inoremap <silent> <Home> <C-O>:call SmartHome()<CR>
 
 
" From http://got-ravings.blogspot.com/2008/07/vim-pr0n-visual-search-mappings.html
" makes * and # work on visual mode too.
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
 
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
 
" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

