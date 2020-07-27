set exrc

set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

    " Completion
    Plug 'valloric/youcompleteme', {'do': './install.py --clangd-completer --rust-completer --java-completer'}
    Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}
    Plug 'vim-scripts/dbext.vim'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Markdown
    Plug 'tpope/vim-markdown'
    Plug 'junegunn/goyo.vim'

    " Git
    Plug 'tpope/vim-fugitive'

    " Misc
    Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/nerdcommenter'
    Plug 'vim-airline/vim-airline'
    Plug 'vim-syntastic/syntastic'
    "Plug 'beloglazov/vim-online-thesaurus'
    Plug 'tpope/vim-surround'
    Plug 'tpope/vim-repeat'
    Plug 'tpope/vim-eunuch'
    Plug 'michaeljsmith/vim-indent-object'

    " Finders
    if executable('fzf')
        Plug 'junegunn/fzf'
        Plug 'junegunn/fzf.vim'
    else
        Plug 'ctrlpvim/ctrlp.vim'
    endif

    Plug 'kien/rainbow_parentheses.vim'

    " Scala
    Plug 'derekwyatt/vim-scala'

    " Rust
    Plug 'rust-lang/rust.vim'

    " Writing
    Plug 'reedes/vim-pencil'

    " Themes
    "Plug 'https://github.com/chriskempson/vim-tomorrow-theme'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'croaker/mustang-vim'

    " Nav
    Plug 'easymotion/vim-easymotion'
    Plug 'yuttie/comfortable-motion.vim'

    Plug 'majutsushi/tagbar'

    Plug 'francoiscabrol/ranger.vim'

    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
call plug#end()

filetype plugin indent on

set path+=** "matches everything under the base directory tree

set wildmenu "upgrades tab completion for buffer/file selection

set relativenumber
set numberwidth=3 " 3 is enough

"set signcolumn=yes " always show the error column, to prevent jarring jumps
set signcolumn=number " better yet, put them in the numbers column

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

set ttyfast
set mouse=a

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
    map <Leader>t :FzfTags<cr>
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
nmap <space> <Plug>(easymotion-bd-w)

map <bs> <c-o><cr>

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

"map <c-t> :tabnew<cr>
"map <tab> :tabnext<cr>
"map <c-s-tab> :tabprevious<cr>
"map <c-w> :tabclose
"imap <c-t> :tabnew<cr>
"imap <c-tab> :tabnext<cr>
"imap <c-s-tab> :tabprevious<cr>
"imap <c-w> :tabclose
"vmap <c-t> :tabnew<cr>
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

let g:ycm_confirm_extra_conf = 0

let g:UltiSnipsExpandTrigger = "<c-right>"
let g:UltiSnipsJumpForwardTrigger = "<c-down>"
let g:UltiSnipsJumpBackwardTrigger = "<c-up>"

let g:ycm_complete_in_comments = 1

" sane preview popup settings
set previewpopup=height:10,width:60,highlight:PMenuSbar
set completeopt+=popup
set completepopup=height:15,width:60,border:off,highlight:PMenuSbar

let g:syntastic_rust_checkers = [] " remove cargo checker, takes up a lot of time even with no changes on writing

nmap <silent> gd :YcmCompleter GoToDefinition<cr>
nmap <silent> gi :YcmCompleter GoToImprecise<cr>
nmap <silent> gr :YcmCompleter GoToReferences<cr>
nmap <silent> gt :YcmCompleter GoTo<cr>

" retain visual selection after indenting:
vnoremap > >gv
vnoremap < <gv

" Russian
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

au VimEnter * RainbowParenthesesToggle

noremap <M-LeftMouse> <4-LeftMouse>
inoremap <M-LeftMouse> <4-LeftMouse>
onoremap <M-LeftMouse> <C-C><4-LeftMouse>
noremap <M-LeftDrag> <4-LeftDrag>
inoremap <M-LeftDrag> <4-LeftDrag>
onoremap <M-LeftDrag> <C-C><4-LeftDrag>

" fixes NerdTree not working in xterm (jumper problem, Enter sends keypad Enter with NumLock off)
" map OM <CR>

if executable('imcat')
    map <F9> :term ++curwin imcat %<cr>
endif

autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/

" 'fix' for https://github.com/vim/vim/issues/5617 (random [>4;2m appearing)
let &t_TI=""
let &t_TE=""

" undo across sessions
let vim_dir = '$HOME/.vim'
let &runtimepath.=','.vim_dir

if has('persistent_undo')
    let undo_dir = expand(vim_dir . '/undo')

    call system('mkdir ' . vim_dir)
    call system('mkdir ' . undo_dir)
    let &undodir = undo_dir
    set undofile
    set undolevels=1000
    set undoreload=10000    " max lines to save
endif
