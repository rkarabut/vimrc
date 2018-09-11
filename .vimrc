set exrc

" required for Vundle

set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

    Plugin 'gmarik/Vundle.vim'

    " add plugins here 
    Plugin 'valloric/youcompleteme'
    "Plugin 'lambdalisue/vim-pyenv'

    " Markdown
    Plugin 'tpope/vim-markdown'
    "Plugin 'nelstrom/vim-markdown-folding'

    " Git
    Plugin 'tpope/vim-fugitive'

    " Misc
    "Plugin 'vim-scripts/vimwiki'
    Plugin 'scrooloose/nerdtree'
    Plugin 'vim-airline/vim-airline'
    "Plugin 'scrooloose/syntastic'
"    Plugin 'beloglazov/vim-online-thesaurus'   
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
    Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'severin-lemaignan/vim-minimap'
    " Clojure
    "Plugin 'tpope/vim-fireplace'
    "Plugin 'guns/vim-clojure-static'
    Plugin 'kien/rainbow_parentheses.vim'

    " Scala
    Plugin 'derekwyatt/vim-scala'

    " Python
    "Plugin 'python-mode/python-mode'

    " Themes
"    Plugin 'https://github.com/chriskempson/vim-tomorrow-theme'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'croaker/mustang-vim'

call vundle#end()

filetype plugin indent on

set nocompatible    " vim only
set backspace=indent,eol,start  " allow backspace in insert mode
set expandtab
set tabstop=4       " smaller tabs
set shiftwidth=4
set wrap            " enable word wrapping
set linebreak       " only wrap at breaks
set autoindent
set smartindent
set hidden          " allow hidden buffers
set number          " line numbers
set smarttab
set hlsearch
set incsearch
set title
"set visualbell
set history=1000
set undolevels=1000
set pastetoggle=<F2>
filetype plugin indent on   " language-dependent indenting 

set t_Co=256
colorscheme mustang
syntax on

" Airline
set laststatus=2    " status bar always enabled
let g:airline#extensions#wordcount#enabled = 1

"set ttyfast
set mouse=a

"set clipboard=unnamed
"let g:jedi#show_call_signatures = "2"

let g:ctrlp_map = '<c_p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files=0

map <F3> :NERDTreeToggle<CR>

vmap <tab> >gv
vmap <s-tab> <gv

map <c-t> :tabnew<cr>
map <tab> :tabnext<cr>
"map <c-s-tab> :tabprevious<cr>
"map <c-w> :tabclose
imap <c-t> :tabnew<cr>
"imap <c-tab> :tabnext<cr>
"imap <c-s-tab> :tabprevious<cr>
"imap <c-w> :tabclose
vmap <c-t> :tabnew<cr>
"vmap <c-tab> :tabnext<cr>
"vmap <c-s-tab> :tabprevious<cr>
"vmap <c-w> :tabclose
"
"filetype plugin on
"set omnifunc=syntaxcomplete#Complete

":autocmd VimEnter * :AirlineRefresh

" retain visual selection after indenting:
vnoremap > >gv
vnoremap < <gv

" Russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
map <capslock> <c-^>

au VimEnter * RainbowParenthesesToggle
