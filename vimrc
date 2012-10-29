"to use default vim feature
set nocompatible

" Pathogen settings.
filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype plugin indent on

"modelines is used to give the number of lines to for searching for vim mode in file
"modeline ex /* vim: shiftwidth=4: */
"since I never add modeline to a file
set modelines=0


" Naviagations using keys up/down/left/right
" Disabling default keys to learn the hjkl
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> :tabprevious<cr>
nnoremap <right> :tabnext<cr>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

"Settings for Searching and Moving
nnoremap / /\v
vnoremap / /\v

" Get Rid of stupid Goddamned help keys
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Remap VIM 0 to first non-blank character
noremap 0 ^

nnoremap <tab> %
vnoremap <tab> %

" jj For Quicker Escaping between normal and editing mode.
inoremap jj <ESC>
" Treat long lines as break lines (useful when moving around in them)
map j gj
map k gk

set gdefault

" Make Vim to handle long lines nicely.
set wrap
set textwidth=120
set formatoptions=qrn1
set colorcolumn=120
colorscheme desert

"configured the tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab                               "To insert space characters whenever the tab key is pressed, set the 'expandtab' option
set smarttab

" More Common Settings.
set encoding=utf-8

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Working with split screen nicely  Resize Split When the window is resized"
au VimResized * :wincmd =

"The 'scrolloff' (scroll offset) option determines the minimum number of screen lines that you would like above and below the cursor.
"By default, 'scrolloff' is 0 which means that you can move the cursor to any line in the window without causing scrolling.
set scrolloff=3

set autoindent
set smartindent

set ignorecase
set smartcase

set incsearch
set hlsearch

set background=dark                         "syntax highlighting will occur accordingly
set magic                                   " For regular expressions turn magic on
set ffs=unix,dos,mac                        "Set filesystem
set showmatch                               "show matching parantheses and brackets
set mat=2                                   " How many tenths of a second to blink when matching brackets
set number 									"Set line numbers
set showtabline=2                           "Always show the tabline irrespective of number of tabs
set cursorline 								"highlight the line on which cursor is
set laststatus=2							"to show the bottom status line always
set ttyfast 								"for fast terminal connection. works well with xterm
set lazyredraw                              "for good performance with macros
set ruler 									"Show the line and column number of the cursor position
set backspace=indent,eol,start              "configures backspace"
set whichwrap+=<,>,h,l                      "sets h and l to move to next line in case they are first/last character of line
set showmode								"Shows the mode in which Vim is - Insert, Visual, Select
set showcmd 								"Shows the command as its typed in
set cmdheight=1 							"Height of the command bar
set title                                   " Set title to window
set hidden 									"Buffer is hidden as soon as its abandoned
set history=700 							"A history of ':' commands, and a history of previous search patterns are remembered. default 20
set autoread 								"Set to auto read when a file is changed from the outside
set pastetoggle=<F3>                        " Make pasting done without any indentation break."
set nobackup                                "turn off backing up of files
set nowritebackup                           "doesn't create a backup file before overwriting one
set noswapfile                              "no swap file
set viminfo^=%                              " Remember info about open buffers on close
set tags=tags;/                             "Use the first available 'tags' file in the directory tree:
syntax enable                               "Enable syntax highlighting

set wildmenu 								"Enables tab to do autocompletion
"specify the mode for autocompletion - show all possible matches and complete to longest matching string
set wildmode=list:longest
set wildignore=*.o,*~,*.pyc 				"Ignore compiled files
set wildignore+=.hg,.git,.svn               " Version Controls"
set wildignore+=*.aux,*.out,*.toc           "Latex Indermediate files"
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Binary Imgs"
set wildignore+=*.o,*.obj,*.exe,*.dll,*.manifest "Compiled Object files"
set wildignore+=*.spl                       "Compiled speolling world list"
set wildignore+=*.sw?                       "Vim swap files"
set wildignore+=*.DS_Store                  "OSX SHIT"
set wildignore+=*.luac                      "Lua byte code"
set wildignore+=migrations                  "Django migrations"
set wildignore+=*.pyc                       "Python Object codes"
set wildignore+=*.orig                      "Merge resolution files"

" Swap ; and :  Convenient.
nnoremap ; :
nnoremap : ;

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","

let g:mapleader = ","
" omnifunc
inoremap <leader><tab> <C-x><C-o>
" Fast saving
nnoremap <leader>w :w!<cr>

" Close the current buffer
noremap <leader>bd :Bclose<cr>
" Close all the buffers
noremap <leader>ba :1,1000 bd!<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Useful mappings for managing tabs
noremap <leader>tn :tabnew<cr>
noremap <leader>to :tabonly<cr>
noremap <leader>tc :tabclose<cr>
noremap <leader>tm :tabmove
noremap <leader>tl :tabnext<cr>
noremap <leader>th :tabprevious<cr>

"Disable highlight when <leader><cr> is pressed
noremap <leader><space> :noh<cr>

"Opens a new tab with the current buffer's path
"Super useful when editing files in the same directory
noremap <leader>te :tabedit <c-r>=expand("%:p:h")<cr>/
"Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Open vimgrep and put the cursor in the right position
noremap <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
" Vimgreps in the current file
noremap <leader>s :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>
" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>
" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Do :help cope if you are unsure what cope is. It's super useful!
"
" When you search with vimgrep, display your results in cope by doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
noremap <leader><F2> :botright cope<cr>
noremap <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
noremap <leader>n :cn<cr>
noremap <leader>p :cp<cr>

" Remove trailing white spaces while saving any type of file
autocmd BufWritePre * :%s/\s\+$//e

"Helper function for searching
function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"highlight word under cursor
highlight flicker gui=bold guifg=white
au CursorMoved <buffer> exe 'match flicker /\V\<'.escape(expand('<cword>'), '/').'\>/'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Dictionary path, from which the words are being looked up.
set dictionary=/usr/share/dict/words

" Pressing ,ss will toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<c-r>

" Shortcuts using <leader> options for spell check
" next search
noremap <leader>sn ]s
" previous spell check
noremap <leader>sp [s
" add word to spell check
noremap <leader>sa zg
" see the suggestion for words
noremap <leader>s? z=

" ,v Select just pasted text.
nnoremap <leader>v V`]

" Make Sure that Vim returns to the same line when we reopen a file"
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \ execute 'normal! g`"zvzz' |
        \ endif
augroup END

" =========== END Basic Vim Settings ===========


" =========== Gvim Settings =============

" Removing scrollbars
if has("gui_running")
    set guitablabel=%-0.12t%M
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    set guioptions+=a
    set guioptions+=m
    set guioptions+=e
    color badwolf
    set t_Co=256
    set listchars=tab:▸\ ,eol:¬         " Invisibles using the Textmate style
endif

" ========== END Gvim Settings ==========
