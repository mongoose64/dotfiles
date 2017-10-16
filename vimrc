if has('nvim')
  let vimplug_path='~/.local/share/nvim/site/plugged'
else
  let vimplug_path='~/.local/share/vim/site/plugged'
endif

call plug#begin(vimplug_path)
Plug 'skywind3000/asyncrun.vim'
Plug 'rhysd/clever-f.vim'
Plug 'Raimondi/delimitMate'
Plug 'haya14busa/incsearch.vim'
Plug 'haya14busa/incsearch-easymotion.vim'
Plug 'haya14busa/incsearch-fuzzy.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/rainbow_parentheses.vim'
Plug 'Shougo/unite.vim'
Plug 'vim-airline/vim-airline'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/vim-peekaboo'
Plug 'junegunn/vim-journal'
Plug 'thinca/vim-quickrun'
Plug 'tpope/vim-sensible'
Plug 'junegunn/vim-slash'
Plug 'tpope/vim-unimpaired'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'tpope/vim-eunuch'


Plug 'junegunn/vim-easy-align'

" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

if !has('nvim')
  Plug 'Shougo/vimproc.vim', { 'do': 'make' }
  Plug 'Shougo/vimshell.vim'
endif
function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.py
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }

" theme
Plug 'altercation/vim-colors-solarized'
Plug 'junegunn/seoul256.vim'

" edit
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-commentary'
Plug 'mbbill/undotree', { 'on': 'UndotreeToggle' }
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'junegunn/vim-online-thesaurus'
Plug 'sgur/vim-editorconfig'
Plug 'Yggdroot/indentLine', { 'on': 'IndentLinesEnable' }
autocmd! User indentLine doautocmd indentLine Syntax

 " Lint
Plug 'w0rp/ale'
" Initialize plugin system
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                       from vim-diff default setting                        "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if !has("nvim")
  filetype plugin indent on
  set autoindent
  set backspace=indent,eol,start
  set belloff=all
  set complete-=i
  set display=lastline
  set formatoptions=tcqj
  set history=10000
  set hlsearch
  set incsearch
  set langnoremap
  set laststatus=2
  set listchars=tab:>-,trail:-,nbsp:+
  set nocompatible
  set nrformats=bin,hex
  set ruler
  set sessionoptions-=options
  set showcmd
  set smarttab
  set tabpagemax=50
  set tags=./tags;,tags
  set ttyfast
  set viminfo+=!
  set wildmenu
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              common settings                               "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has('nvim')
  set helplang=en
else
  set helplang=cn
endif

set encoding=utf-8
set nu
set cuc
set cc=79
set mouse+=a
set autoread
set ruler
set relativenumber
set cursorline
set startofline
" always set tabstop=8 but set shifttabstop/softtabstop/expandtab to another
"+values
set tabstop=8

" make split better for modern monitor
let g:ft_man_open_mode = 'vert'
set splitbelow
set splitright
" make help vsplit
cnoreabbrev H vert h
cnoreabbre HR vert bo h

" fold
set foldmethod=indent
set foldlevel=99
nnoremap <space> za

au BufNewFile,BufRead *.py set softtabstop=4 shiftwidth=4 expandtab autoindent fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css, set softtabstop=2 shiftwidth=2 expandtab

au BufReadPost * if line("'\"")>0 && line("'\"")<=line("$") | exe "normal g`\"" | endif

au BufNewFile,BufRead *.sh set softtabstop=2 shiftwidth=2 expandtab

au BufNewFile,BufRead,FileType vim set softtabstop=2 shiftwidth=2 expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                common maps                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

if has("nvim")
  " for nvim, we have termimal
  tnoremap <Esc> <C-\><C-n>
  tnoremap <expr> <C-R> '<C-\><C-N>"'.nr2char(getchar()).'pi'
  tnoremap <A-h> <C-\><C-N><C-w>h
  tnoremap <A-j> <C-\><C-N><C-w>j
  tnoremap <A-k> <C-\><C-N><C-w>k
  tnoremap <A-l> <C-\><C-N><C-w>l
endif
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <leader>s :w<Enter>
nnoremap <leader>r <leader>s:!%:p<Enter>
"nnoremap <silent> <C-n> :set relativenumber!<cr>

nnoremap oo o<Esc>j

inoremap jk <Esc>
noremap jk <Esc>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                colorscheme                                 "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable
set background=dark
colorscheme solarized

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    ycmd                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" config the ycmd
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_use_ultisnips_completer = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                    ale                                     "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" config the ale
let g:ale_python_isort_executable = 'isort'
let g:ale_python_pylint_executable = 'python3'
let g:ale_python_pylint_options = '-m pylint'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                fuzzy motion                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

map /  <Plug>(incsearch-fuzzy-/)
map ?  <Plug>(incsearch-fuzzy-?)
map g/ <Plug>(incsearch-fuzzy-stay)

function! s:config_easyfuzzymotion(...) abort
  return extend(copy({
  \   'converters': [incsearch#config#fuzzy#converter()],
  \   'modules': [incsearch#config#easymotion#module()],
  \   'keymap': {"\<CR>": '<Over>(easymotion)'},
  \   'is_expr': 0,
  \   'is_stay': 1
  \ }), get(a:, 1, {}))
endfunction
noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())

map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                   snips                                    "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsUsePythonVersion = 3
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
