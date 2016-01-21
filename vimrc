" VIMRC
if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif


if has("gui_running")
    " default colorscheme
    colorscheme darkblue

    if filereadable($VIMHOME."/colors/argonaut.vim")
        colorscheme argonaut
    endif

"    au GUIEnter * simalt ~x
    set guioptions-=T" no toolbar

    " tab control works in gui mode
    :map <C-Left> :tabprevious<cr>
    :map <C-Right> :tabnext<cr>
    :map <C-S-tab> :tabprevious<cr>
    :map <C-tab> :tabnext<cr>

else
    " default colorscheme
    colorscheme delek

    set t_Co=256
    if filereadable($VIMHOME."/colors/argonaut.vim")
        colorscheme argonaut
    endif


    set clipboard=autoselect,exclude:.*

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
endif

" mouse requires an xterm terminal type and putty->terminal->disable application keypad
set mouse=nv      " enable mouse in console mode

set wildmenu        " nice menu at bottom of screen
set wildmode=longest:list,full
"set wildmode=longest:full
set wildignore=*.o,*.pyc,.svn,*.swp,*.exe,*.d,*.CFG,*.P

syntax on            " enable syntax highlighting
set backspace=2      " allow backspace over previously entered characters
set nu               " enable line numbers
set autoindent       " enable automatic line indenting
set nosmartindent
set cindent
set tabstop=4        " tabstops to 4
set shiftwidth=4     " tabs are worth 4 spaces
set expandtab        " use spaces instead of tabs
set foldmethod=indent
set foldlevel=99
set showmatch    " jump to matching parentheis
set hlsearch
set tabpagemax=99

"background terminal
set ruler    " show the line and column position at all times
set incsearch   " jump to search matches as you type
"highlight pythonComment ctermfg=green

" change the location of vi temp/swap files
set backupdir=~/.vim/tmp
set directory=~/.vim/tmp
set history=1000

" options for FoldDigest
"let folddigest_options="flexnumwidth,nofoldclose,maximise"

":map <silent> <F12> :OUTLINE<CR>

if has("autocmd")
   " Enabled file type detection.  Use the default filetype settings.
   " Also load indent files to automatically do language-dependent indenting.
    execute pathogen#infect()
    filetype on            " enables filetype detection
    filetype plugin on     " enables filetype specific plugins
    filetype plugin indent on
    "    autocmd BufRead *.py smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"    autocmd BufWritePre *.py normal m`:%s/\s\+$//e ``
    au BufRead,BufNewFile *.jade set filetype=javascript
endif


" C-\ - Open the definition in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" A-] - Open the definition in a vertical split
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

set tags=tags;/ " search for tags in the current directory up to root

" regenerate ctags
"map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q -IENUMU8,ENUMU16,ENUMU32,ENUMS8,ENUMS16,ENUMS32 .<CR>
map <F8> :!/usr/bin/ctags -R .<CR>

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 30
map <F4> :TlistToggle<cr>

" highlight extra long lines
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%91v.*/

" highlight extra whitespace
highlight ExtraWhitespace ctermbg=55 ctermfg=white guibg=#592929
"match ExtraWhitespace  /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/

" remove whitespace at the end of lines when saving
autocmd BufWritePre * :%s/\s\+$//e


" change the colour of pyflakes highlighting
"hi SpellBad term=underline ctermbg=55 ctermfg=white guibg=Brown guifg=White

" syntastic settings
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for vim-airline
set laststatus=2
set cursorline
