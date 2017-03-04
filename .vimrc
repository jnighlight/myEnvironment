set nocompatible              " be iMproved, required
filetype off                  " required

"Can't backspace indents without this? ew"
set bs=indent,eol,start
set ai
set ts=4
set sw=4
set et
set viminfo='50,<600,s50
:inoremap jj <Esc>

syntax on
"trying to make this thing not lag
"set ttyfast
"set lazyredraw

"setting undo files
set undodir=/home/vagrant/.vim/undo
set undofile
set undolevels=500

"custom vim scripts I use
let @r = 'viw"0p'
let @p = 'vi("0p'
let @c = "f,a\<cr>jjf,a\<cr>jjf,a\<cr>jjf,a\<cr>jj"

set nocompatible              " be iMproved, required
filetype off                  " required
"set tw=120                    " Text wrapping at 120 Characters (HW standard) - this was annyoing at best

 "set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()
 " alternatively, pass a path where Vundle should install plugins
 "call vundle#begin('~/some/path/here')

 " let Vundle manage Vundle, required
 Plugin 'VundleVim/Vundle.vim'

 Plugin 'a.vim'
 Plugin 'raimondi/delimitmate'
 Plugin 'ryanss/vim-hackernews'
 Plugin 'dietsche/vim-lastplace'
 Plugin 'vim-airline/vim-airline'
 Plugin 'vim-airline/vim-airline-themes'
 Plugin 'edkolev/tmuxline.vim'
 Plugin 'scrooloose/nerdtree'
 Plugin 'kana/vim-fakeclip'
 Plugin 'altercation/vim-colors-solarized'
 Plugin 'tpope/vim-fugitive'
 Plugin 'majutsushi/tagbar'
 Plugin 'scrooloose/nerdcommenter'

"set tags based on .ctags in projects"
:set tags+=/usr/local/projects/.ctags
"Vim file explorer file layout"
let g:netrw_liststyle=3
"Make vim file explorer come up from Cntrl-H
map <C-h> :NERDTreeToggle<cr>

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

"To get colors in vim airline while running tmux line
set t_Co=256

"to get vimairline to actually show up
set laststatus=2

 " All of your Plugins must be added before the following line
 call vundle#end()            " required
 filetype plugin indent on    " required
 " To ignore plugin indent changes, instead use:
 "filetype plugin on
 "
 " Brief help
 " :PluginList       - lists configured plugins
 " :PluginInstall    - installs plugins; append `!` to update or just
 "":PluginUpdate
 " :PluginSearch foo - searches for foo; append `!` to refresh local cache
 " :PluginClean      - confirms removal of unused plugins; append `!` to
 "auto-approve removal
 "
 " see :h vundle for more details or wiki for FAQ
 " Put your non-Plugin stuff after this line
 source ~/.vim/scripts
 
 "In case this isn't set by default, highlight search words
 set hlsearch
 
 "Wanting to see leader and other commands in vim
 set showcmd
 "I don't want leader commands or scripts to timeout
 set notimeout
 set nottimeout
