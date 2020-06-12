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
    Plugin 'junegunn/goyo.vim'
    "Plugin 'nelstrom/vim-markdown-folding'

    " Git
    Plugin 'tpope/vim-fugitive'

    " Misc
    "Plugin 'vim-scripts/vimwiki'
    Plugin 'scrooloose/nerdtree'
    Plugin 'scrooloose/nerdcommenter'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-syntastic/syntastic'
    "Plugin 'beloglazov/vim-online-thesaurus'  
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-repeat'
	Plugin 'tpope/vim-eunuch'

    if executable('fzf')
        Plugin 'junegunn/fzf'
        Plugin 'junegunn/fzf.vim'
    else
        Plugin 'ctrlpvim/ctrlp.vim'
    endif
    
    " Snippets
    Plugin 'SirVer/ultisnips'
    Plugin 'honza/vim-snippets'
    
    "Plugin 'w0rp/ale'

    " Clojure
    "Plugin 'tpope/vim-fireplace'
    "Plugin 'guns/vim-clojure-static'
    Plugin 'kien/rainbow_parentheses.vim'

    " Scala
    Plugin 'derekwyatt/vim-scala'

    " Python
    "Plugin 'python-mode/python-mode'

    " Rust
    Plugin 'rust-lang/rust.vim'

	" Writing
	Plugin 'reedes/vim-pencil'

    " Themes
    "Plugin 'https://github.com/chriskempson/vim-tomorrow-theme'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'croaker/mustang-vim'

	" Nav
	Plugin 'easymotion/vim-easymotion'

	Plugin 'majutsushi/tagbar'
call vundle#end()

filetype plugin indent on

set path+=** "matches everything under the base directory tree

set wildmenu "upgrades tab completion for buffer/file selection

set relativenumber

set clipboard=unnamedplus

"set nocompatible " already set
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
filetype plugin indent on " language-dependent indenting

set term=xterm
set t_Co=256
colorscheme mustang
syntax on

" Airline
set laststatus=2    " status bar always enabled
let g:airline#extensions#wordcount#enabled = 1
let g:airline_powerline_fonts = 1

let g:syntastic_scala_scalastyle_jar = $HOME . '/work/scalastyle_2.12-1.0.0-batch.jar'
let g:syntastic_scala_scalastyle_config_file = $HOME . '/work/scalastyle-config.xml'
let g:syntastic_scala_checkers = ['fsc', 'scalac', 'scalastyle']

" nerdcommenter
let g:NERDSpaceDelims = 1

"set ttyfast
set mouse=a

"set clipboard=unnamed
"let g:jedi#show_call_signatures = "2"

let g:fzf_command_prefix = 'Fzf'
let g:fzf_history_dir = '~/.local/share/fzf-history'
if executable('fzf')
    nnoremap <leader>j :call fzf#vim#tags("'".expand('<cword>'))<cr>
    map <c-h> :FzfHistory<cr>
    map <c-p> :FzfFiles<cr>
    map <Leader>b :FzfBuffers<cr>
    command! -bang -nargs=* FzfAg call fzf#vim#ag(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0) " prevent search in filenames
    map <Leader>a :FzfAg<cr>
    map <Leader>l :FzfBLines<cr>
    map <Leader>/ :FzfBLines<cr>
    map <Leader>r :FzfRg<cr>
else
	let g:ctrlp_map = '<c-p>'
	let g:ctrlp_cmd = 'CtrlPMixed'
	let g:ctrlp_max_files=0
	let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'

	if executable('ag')
		let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
	endif
endif

let g:EasyMotion_do_mapping=0 " disable default mappings
let g:EasyMotion_smartcase=1  " enable case-insensitive search
nmap s <Plug>(easymotion-overwin-f2)
nmap , <Plug>(easymotion-bd-w)
    
map <bs> :pop<cr>

map <F3> :NERDTreeToggle<CR>

let g:tagbar_autoclose=1
map <F8> :TagbarToggle<CR>

let g:pencil#wrapModeDefault = 'soft'   

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd,text call pencil#init()
augroup END

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

nnoremap <delete> dd
"jump to latest position
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

":autocmd VimEnter * :AirlineRefresh

" remove end-of-line whitespace in Scala
autocmd FileType scala autocmd BufWritePre <buffer> %s/\s\+$//e

let g:scala_sort_across_groups=1
" autocmd FileType scala autocmd BufWritePre <buffer> :SortScalaImports

" set rust src path for YCM
let g:ycm_rust_src_path = '/home/tr/work/rust/src'
let g:syntastic_rust_checkers = [] " remove cargo checker, takes up a lot of time even with no changes on writing

" retain visual selection after indenting:
vnoremap > >gv
vnoremap < <gv

" Russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

set paste

au VimEnter * RainbowParenthesesToggle

noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <4-LeftDrag>
inoremap <M-LeftDrag> <4-LeftDrag>
onoremap <M-LeftDrag> <C-C><4-LeftDrag>

" fixes NerdTree not working in xterm (jumper problem, Enter sends keypad Enter with NumLock off)
" map OM <CR>

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
