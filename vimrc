" VIMRC
" Note: Skip initialization for vim-tiny or vim-small.
 if 0 | endif

"******************* VIM directories *******************
if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif

" change the location of vi temp/swap files
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

set nocompatible   " use vim settings, not vi

"******************* NEOBUNDLE *******************
 if has('vim_starting')
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 call neobundle#begin(expand('~/.vim/bundle/'))

 NeoBundleFetch 'Shougo/neobundle.vim'  " Let NeoBundle manage NeoBundle

 "  MY BUNDLES
 NeoBundle 'jonathanfilip/vim-lucius'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'klen/python-mode'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'mileszs/ack.vim'
 NeoBundle 'digitaltoad/vim-jade'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'maksimr/vim-jsbeautify'
 NeoBundle 'ervandew/supertab'
 NeoBundle 'saltstack/salt-vim'
 NeoBundle 'scrooloose/nerdtree'

 call neobundle#end()

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck


if has("gui_running")
    "******************* colorscheme *******************
    colorscheme darkblue    " default colorscheme
    if filereadable($VIMHOME."/colors/argonaut.vim")
        colorscheme argonaut
    endif

    "******************* tab control *******************
    :map <C-Left> :tabprevious<cr>
    :map <C-Right> :tabnext<cr>
    :map <C-S-tab> :tabprevious<cr>
    :map <C-tab> :tabnext<cr>

    "au GUIEnter * simalt ~x
    set guioptions-=T" no toolbar

else
    "******************* colorscheme *******************
    set t_Co=256
    colorscheme delek   " default colorscheme
    if filereadable($VIMHOME."/colors/argonaut.vim")
        colorscheme argonaut
    endif

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

" ctrl+left/right - doesn't map well in putty
" putty doesn't send ctrl, so it maps to just left/right too :(
"    :noremap OD :tabprevious<cr>
"    :noremap OC :tabnext<cr>

"    :noremap <C-Left> :tabprevious<cr>
"    :noremap <C-Right> :tabnext<cr>
"    :noremap <C-S-tab> :tabprevious<cr>
"    :noremap <C-tab> :tabnext<cr>
"
    " mouse requires an xterm terminal type and putty->terminal->disable application keypad
    set mouse=nv      " enable mouse in console mode
    set clipboard=autoselect,exclude:.*
endif   " console mode

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
set showmatch       " jump to matching parentheis
set tabpagemax=99
set ruler           " show the line and column position at all times
set hlsearch        " highlight serach terms
set incsearch       " jump to search matches as you type
set history=1000
set cursorline

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
map <F8> :!/usr/bin/ctags -R .<CR>
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 30
map <F4> :TlistToggle<cr>

"******************* style formatting control  *******************
" highlight extra long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.*/

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=55 ctermfg=white guibg=#592929
"match ExtraWhitespace  /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" remove whitespace at the end of lines when saving
autocmd BufWritePre * :%s/\s\+$//e


"******************* syntastic  *******************
" highlight extra long lines
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['flake8']



"********************************************************************
" *********************** CONAN section *****************************
"
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" Use fuzzy finder buffer mode to open buffer
"nmap <C-S-F> :PyLintAuto<CR>
map <Leader>d :CtrlP .<CR>
map <Leader>f :CtrlPBuffer<CR>
set wildignore+=*/coverage/*,*/build/*,*/node_modules/*,*/__pycache__/*,*.ttf,*.svg,*.pyc,*/build-debug/*
" map <Leader>d :FufFileWithCurrentBufferDir<CR>


"******************* pyflakes  *******************
let g:pyflakes_use_quickfix = 0


"******************* python mode  *******************
let g:pymode_rope_goto_definition_bind = '<F3>'
let g:pymode_rope_goto_definition_cmd = 'e'
let g:pymode_rope_complete_on_dot = 0
" Do not let pymode automatically fold
let g:pymode_folding = 1
set foldlevel=1

" Do not let pymode auto fix whitespaces
let g:pymode_utils_whitespaces = 0
let g:pymode_lint_write = 0
let g:pymode_lint_checkers = '[pyflakes,mccabe]'

" DO NOT Auto open cwindow if errors be finded
let g:pymode_lint_cwindow = 0


"******************* supertab  *******************
imap <tab> <C-Space>
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SupertabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1
set completeopt=menuone,longest,preview

" This auto close preview window if you exit the insert mode
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

set relativenumber

" run unittest
nmap <Leader>t :!python3 manage.py test <cword>


"******************* airline  *******************
let g:airline#extensions#tabline#enabled = 1
set laststatus=2


"******************* nerd tree ***********************************************
" Open nerdtree on start
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" C-n to toggle
map <C-n> :NERDTreeToggle<CR>

" Close vim if Nerd tree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
