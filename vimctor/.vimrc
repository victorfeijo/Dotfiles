" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" ================ General Config ====================

scriptencoding utf-8
set encoding=utf-8
set number
set relativenumber
set shell=/bin/zsh
set wildmenu
set wildmode=full
set laststatus=4
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set cursorline
set clipboard=unnamed
set linebreak               " Break long lines by word, not char"

"turn on syntax highlighting
syntax on

" Change leader to a comma because the backslash is too far away
" That means all \x commands turn into ,x
" The mapleader has to be set before vundle starts loading all
" the plugins.
let mapleader=","

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
set pastetoggle=<F2>

filetype plugin on
filetype indent on

" Display tabs and trailing spaces visually
set list listchars=tab:\ \ ,trail:·

" ================ Completion =======================

set wildmode=list:longest
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing
set wildignore+=*vim/backups*
set wildignore+=*sass-cache*
set wildignore+=*DS_Store*
set wildignore+=vendor/rails/**
set wildignore+=vendor/cache/**
set wildignore+=*.gem
set wildignore+=log/**
set wildignore+=tmp/**
set wildignore+=*.png,*.jpg,*.gif

" ================ Search ===========================

set incsearch       " Find the next match as we type the search
set hlsearch        " Highlight searches by default
set ignorecase      " Ignore case when searching...
set smartcase       " ...unless we type a capital

" =============== Map commands =====================

:command WQ wq
:command Wq wq
:command W w
:command Q q

" Map bigger line moves
noremap <C-U> 12<C-U>
noremap <C-D> 12<C-D>

" Delete the current buffer
nmap ,d :bd<CR>

" These are things that I mistype and want ignored.
nmap Q  <silent>
nmap q: <silent>
nmap K  <silent>

" Turn off linewise keys. Normally, the `j' and `k' keys move the cursor down
" one entire line. with
" line wrapping on, this can cause the cursor to actually skip a few lines
" on the screen because
" it's moving from line N to line N+1 in the file. I want this to act more
" visually -- I want `down'
" to mean the next line on the screen
nmap j gj
nmap k gk

" ================ Plugins ==============
call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sickill/vim-pasta'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'raimondi/delimitmate'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'victorfeijo/binding-pry-vim'
Plug 'pbrisbin/vim-mkdir'
Plug 'iCyMind/NeoSolarized'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'

" WakeTime
Plug 'wakatime/vim-wakatime'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" html / templates
Plug 'gregsexton/MatchTag', { 'for': ['html', 'eruby'] } " match tags in html, similar to paren support
Plug 'othree/html5.vim', { 'for': ['html', 'eruby'] } " html5 support

" Ruby Bundles
Plug 'thoughtbot/vim-rspec', { 'for': ['ruby', 'rb'] } " Run RSpecs from vim
Plug 'tpope/vim-endwise', { 'for': ['ruby', 'rb'] } " Auto add end on class, module, def, etc.

" Python
Plug 'python-mode/python-mode', { 'for': ['python'] }

call plug#end()

syntax enable
filetype plugin indent on

" Choose the colorscheme
colorscheme NeoSolarized
set background=dark

" Open Nerd Tree
map <C-n> :NERDTreeToggle<CR>
nmap <leader>n :NERDTreeFind<CR>

" FZF configuration
nmap <C-k> :Ag! "\b<cword>\b" <CR>
nmap <C-p> :Files<CR>
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
let g:fzf_layout = { 'down': '~30%' }

" Airline configs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='jellybeans'

" JSX on javascript files
let g:jsx_ext_required = 0

nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" Rspec
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>a :call RunAllSpecs()<CR>
map <Leader>s :call RunNearestSpec()<CR>

" Pymode
au FileType python set tabstop=4
au FileType python set tabstop=4
au FileType python set softtabstop=4
au FileType python set shiftwidth=4
au FileType python set textwidth=120
au FileType python set expandtab
au FileType python set autoindent
au FileType python set fileformat=unix
au FileType python set wrap

let python_highlight_all=1
let g:pymode_rope = 0
let g:pymode_options_max_line_length = 120
let g:pymode_options_colorcolumn = 0
let g:pymode_lint = 0
let g:pymode_doc = 0
let g:pymode_folding = 0

" Ale Confs
let g:ale_sign_error = ''
let g:ale_echo_msg_error_str = ''
let g:ale_sign_warning = ''
let g:ale_echo_msg_warning_str = ''
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop', 'ruby'],
\   'eruby': []
\}
