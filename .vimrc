set nocompatible                " be iMproved

set bs=indent,eol,start         "Can't backspace indents without this? ew
set ai                          "Auto Indent (when pasting, `:set paste` to get around indent issues
set ts=4                        "Tab == 4 spaces
set sw=4
set et
set viminfo='50,<600,s50        "VimInfo stats for undo's and stuff
set tw=0                        "We _never_ want text to auto-wrap
set nowrap                      "Also don't want text to wrap in our window. A line's a line

set hlsearch                    "In case this isn't set by default, highlight search words
set showcmd                     "Wanting to see leader and other commands in vim
set notimeout                   "I don't want leader commands or scripts to timeout

"Jumping out of insert mode has never been easier!
:inoremap jj <Esc>
"...until now!
:inoremap jk <Esc>

syntax enable                   "Gotta keep syntax highlighting on, duh

"trying to make this thing not lag (left in case I hit this again)
"set ttyfast
"set lazyredraw

"setting undo files
if has("gui_running")           "If we're running gvim
    set undodir=~/vimfiles/undo
else
    set undodir=~/.vim/undo
endif
set undofile
set undolevels=500

"custom vim scripts I use
let @r = 'viw"0p'
let @p = 'vi("0p'
let @c = "f,a\<cr>jjf,a\<cr>jjf,a\<cr>jjf,a\<cr>jj"

set wildmenu                    "Suggested by one jjumalon. Autocomplete :commands w/tab
set wildmode=list:longest,full  "Formatting options for wildmenu

let g:netrw_liststyle=3         "Vim file explorer (netrw) file layout"

if has("gui_running")           "If we're running gvim
    set guioptions-=T           "Removes the toolsbar in gvim

    "colorscheme slate          "And use a lazy, prepacked color scheme
    colorscheme solarized       "Solarized is good, may swap it out at some point
    set background=dark         "Solarized background, dark themes are best themes
    set guifont=consolas:cANSI:qDRAFT        "Use visual studio's default font. Additions suggested from a friend
endif

set encoding=utf-8              "Forces us to utf-8. Also fixes HackerNews plugin. That's...annoying

"------------START OF PLUGINS------------
"set the runtime path to include Vundle and initialize
set rtp+=~/vimfiles/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'          "let Vundle manage Vundle

Plugin 'a.vim'                             "Swap between cpp and h files with :A
Plugin 'raimondi/delimitmate'              "Doubles up quotes and the like
Plugin 'dansomething/vim-hackernews'       "Runs hackernews! Needs python tho
Plugin 'dietsche/vim-lastplace'            "Saves your last place in file. Why does this need a plugin?
if !has("gui_running")   "If we're NOT running gvim
    Plugin 'edkolev/tmuxline.vim'           "This screws with gvim, and we don't use tmux there anyways
    Plugin 'kana/vim-fakeclip'              "Can just copy to clipboard in windows with \"+y
    Plugin 'scrooloose/nerdtree'            "Turns out, netrw is pretty good itself...
    Plugin 'vim-airline/vim-airline'        "Lags with netrw. Might be worth trying nerdtree/vim-airline, but for now f-it
    Plugin 'vim-airline/vim-airline-themes' "Dont want the themes without the plugin, lol
endif
Plugin 'altercation/vim-colors-solarized'  "Solarized is good.
Plugin 'tpope/vim-fugitive'                "Good for projects using git
Plugin 'majutsushi/tagbar'                 "Good if you have a project with tags.
Plugin 'scrooloose/nerdcommenter'          "Comments, all the comments

"-----------Plugin Configuration-----------
:set tags+=/usr/local/projects/.ctags   "set tags based on .ctags in projects

"Make vim file explorer come up from Cntrl-H
map <C-h> :NERDTreeToggle<cr>
"Popup tagbar on F8 push
nmap <F8> :TagbarToggle<CR>

"Getting right symbols instead of question marks in vim airline
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
let g:airline_left_sep = ' '
let g:airline_right_sep = ' '
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

 let g:tmuxline_separators = {
     \ 'left' : '',
     \ 'left_alt': '',
     \ 'right' : '',
     \ 'right_alt' : '',
     \ 'space' : ' '}


"Get all open buffers maybe?
"let g:airline#extensions#tabline#enabled = 1

set laststatus=2                "to get vimairline to actually show up

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 " :PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
 "source ~/vimfiles/scripts
 "------------END OF PLUGINS------------
