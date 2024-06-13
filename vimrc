" VIMRC
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

filetype plugin indent on

"******************* VIM directories *******************
if has('win32') || has ('win64')
    let $VIMHOME = $HOME."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

" ****************** SWAP FILE LOCATIONS **************
let $BACKUPDIR=$VIMHOME."/backups"
if !isdirectory($BACKUPDIR)
    call mkdir($BACKUPDIR, "p")
endif
set backupdir=$BACKUPDIR

let $SWAPDIR=$VIMHOME."/swaps"
if !isdirectory($SWAPDIR)
    call mkdir($SWAPDIR, "p")
endif
set directory=$SWAPDIR


"*********************  PLUGIN MANAGEMENT - uses vim-plug: install using:
"   curl -fLo ~/.vim/autoload/plug.vim --create-dirs     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   then run :PlugInstall
call plug#begin($VIMHOME.'/plugged')
Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'     " used for flake8 linting - might need to install flake8 separately
call plug#end()

if has("gui_running")
    "******************* colorscheme *******************
    colorscheme darkblue    " default colorscheme

    "******************* tab control *******************
    :map <C-Left> :tabprevious<cr>
    :map <C-Right> :tabnext<cr>
    :map <C-S-tab> :tabprevious<cr>
    :map <C-tab> :tabnext<cr>
    "au GUIEnter * simalt ~x
    set guioptions-=T" no toolbar
    if has('win32') || has ('win64')
        set guifont=Courier_New:h11
    else
        set guifont=Mono
    endif
else

    "******************* colorscheme *******************
    set t_Co=256
    colorscheme delek   " default colorscheme

    "******************* tab control *******************
    " some chars don't pass through in putty - thus we have to actually type
    " ctrl-v ctrl-leftarrow in insert mode to get the combo
    " sometimes that doesn't work either in which case one has to put
    " Esc[D or Esc[5D or something like that.  it is also highly
    " dependent upon the TERM set in the environment.  try using linux
    " xterm doesn't seem to pass any characters through when in putty
    " but xterm is required for the mouse to work :(  xterm also causes
    " left/right arrows to switch tabs by themselves
    "
    " set Terminal->KeyBoard->ApplicationKeypadSettings.Initial to Application
    " for these below to work
    :noremap [D :tabprevious<cr>
    :noremap [C :tabnext<cr>

    :noremap <ESC>[1;5D :tabprevious<cr>
    :noremap <ESC>[1;5C :tabnext<cr>

"    :noremap <C-Left> :tabprevious<cr>
"    :noremap <C-Right> :tabnext<cr>
"    :noremap <C-S-tab> :tabprevious<cr>
"    :noremap <C-tab> :tabnext<cr>
"
    " mouse requires an xterm terminal type and putty->terminal->disable application keypad
    set mouse=nv      " enable mouse in console mode
    "set clipboard=autoselect,exclude:.*
    set clipboard=unnamed
endif   " console mode

if filereadable($VIMHOME."/colors/argonaut.vim")
    " copy this from Dotfiles directory
    colorscheme argonaut
endif


"******************* misc control  *******************
set wildmenu        " nice menu at bottom of screen
set wildmode=longest:list,full
set wildignore=*.o,*.pyc,.svn,*.swp,*.exe,*.d,*.CFG,*.P

syntax on            " enable syntax highlighting
"set backspace=2      " allow backspace over previously entered characters
set backspace=indent,eol,start " allow backspacing over everything in insert mode
set number           " enable line numbers
set showcmd		     " display incomplete commands
set autoindent       " enable automatic line indenting
set nosmartindent
set cindent
set tabstop=4        " tabstops to 4
set shiftwidth=4     " tabs are worth 4 spaces
set expandtab        " use spaces instead of tabs
set foldmethod=indent
set foldlevel=99
set showmatch       " jump to matching parentheis
set tabpagemax=99
set ruler           " show the line and column position at all times
set hlsearch        " highlight serach terms
set incsearch       " jump to search matches as you type
set history=1000
set colorcolumn=80  " marker for 80 column
set cursorline
set switchbuf+=usetab,newtab " use new tab from quickfix list
set t_ut=

if has("autocmd")
   " Enabled file type detection.  Use the default filetype settings.
   " Also load indent files to automatically do language-dependent indenting.
    filetype on            " enables filetype detection
    filetype plugin on     " enables filetype specific plugins
    filetype plugin indent on
    au BufRead,BufNewFile *.jade set filetype=javascript
endif


"******************* CTAGS  *******************
" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set tags=tags;/ " search for ctags in the current directory up to root

" regenerate ctags
if has('win32') || has ('win64')
map <F8> :!/Progra~2/vim/ctags -R .<CR>
let Tlist_Ctags_Cmd = "$VIMRUNTIME/ctags"
else
	map <F8> :!/usr/bin/ctags -R .<CR>
	let Tlist_Ctags_Cmd = "/usr/bin/ctags"
endif
let Tlist_WinWidth = 30
map <F4> :TlistToggle<cr>
map <F2> :lnext<cr>

"******************* style formatting control  *******************
" highlight extra long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.*/

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=55 ctermfg=white guibg=#592929
"match ExtraWhitespace  /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" remove whitespace at the end of lines when saving
autocmd BufWritePre * :%s/\s\+$//e


"******************* ALE  *******************
" Check Python files with flake8 and pylint.
let b:ale_linters = ['flake8'] ", 'pylint']
" Fix Python files with autopep8 and yapf.
let b:ale_fixers = ['autopep8', 'yapf']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%:%code%] %s [%severity%]'

"******************* pyflakes  *******************
let g:pyflakes_use_quickfix = 0


"******************* airline  *******************
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline_section_z="%p%% / %c / %l / %L tot"
set laststatus=2


"******************* nerd tree ***********************************************
" Open nerdtree on start
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" C-n to toggle
map <C-n> :NERDTreeToggle<CR>

" Close vim if Nerd tree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
