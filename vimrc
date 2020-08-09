set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
set lazyredraw
set clipboard=unnamed
set backspace=indent,eol,start
set showtabline=2
" set noshowmode
set cmdheight=2
" set signcolumn=no
set autoread
set showmatch
set incsearch
set hlsearch
set ignorecase
set smartcase
set tabstop=2
set shiftwidth=2
set expandtab
set softtabstop=2
set autoindent
set smartindent
set linebreak
set breakindent
set magic
set number
set noautochdir
set cursorline
augroup CursorLineOnlyInActiveWindow "{{{
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave,BufLeave * setlocal nocursorline
augroup END
" }}}
set scrolloff=8
set splitbelow
set splitright
set eadirection=both
set equalalways
set foldmethod=marker
set relativenumber

" Filetype specific settings
" autocmd FileType help setlocal colorcolumn=80

" Keybindings
nnoremap <space> :
map ; <Leader>
let mapleader = ";"
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-w><C-L>
nnoremap <C-H> <C-w><C-H>
set mouse=a

" vim-plug
call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sickill/vim-pasta'
  Plug 'jiangmiao/auto-pairs'
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'psliwka/vim-smoothie'
  Plug 'djoshea/vim-autoread'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'sheerun/vim-polyglot'
  Plug 'jcherven/jummidark.vim'
call plug#end()

" GUI vim (macvim, gvim, etc) Settings {{{
if has('gui')
  set belloff=all
  " Font setting
  if has("gui_macvim")
    set guifont=Dina:h16
  elseif has("gui_win32")
    set guifont=Terminus:h12
  endif
  set guicursor+=a:blinkon0
  set lines=45 columns=84
  " Displays the statusline when there is no split
  set laststatus=2
  " Start without menubar or toolbar
  " a - auto select for system copy/paste
  " c - Use console dialogs instead of system popups
  set guioptions="ac"
  " Enable the visual completion menu for the command line
  source $VIMRUNTIME/menu.vim
  set wildmenu
  set cpo-=<
  set wcm=<C-Z>
  map <F4> :emenu <C-Z>
endif
" }}}

" set termguicolors
silent! colorscheme jummidark
