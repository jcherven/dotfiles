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
autocmd FileType help setlocal colorcolumn=80

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
  Plug 'tpope/vim-fugitive'
  Plug 'AndrewRadev/tagalong.vim'
  Plug 'gcmt/taboo.vim' "{{{
  let g:taboo_tabline=1
  let g:taboo_modified_tab_flag="[+]"
  fun! GitInfo()
    let git = fugitive#head()
    if git != ''
      return ' '.git.''
    else
      return ''
    endif
  endfunction
  let g:taboo_tab_format="▏%N:%P%m %{GitInfo()}▕"
  let g:taboo_renamed_tab_format="▏%N:%l%m %{GitInfo()}▕"
  "}}}
  " Plug 'scrooloose/nerdtree' "{{{
  " " Performs NERDTreeFind on open, toggles the buffer on close.
  " function! NERDTreeFindToggle()
  "   if exists("g:NERDTree") && g:NERDTree.IsOpen()
  "     NERDTreeClose
  "     elseif filereadable(expand('%'))
  "     NERDTreeFind
  "     else
  "     NERDTree
  "   endif
  " endfunction
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " map <leader>/ :call NERDTreeFindToggle()<CR>
  " let g:NERDTreeMapJumpParent = "h"
  " let g:NERDTreeMapActivateNode = "l"
  " let NERDTreeMinimalUI=1
  " let g:NERDTreeWinPos = "left"
  " let g:NERDTreeShowLineNumbers=1
  " let g:NERDTreeDirArrows=1
  " let g:NERDTreeAutoDeleteBuffer=1
  " let g:NERDTreeShowHidden=1
  " let g:NERDTreeSortHiddenFirst=1
  " let g:NERDTreeQuitOnOpen=1
  " let g:NERDTreeStatusline="| menu:m | help:? |"
  " "}}}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  let g:ale_completion_enabled=1
  " Plug 'dense-analysis/ale' "{{{
  " let g:ale_fix_on_save=0
  " let g:ale_linters_explicit=1
  " let g:ale_javascript_prettier_options='--single-quote'
  " let g:ale_linters={
  "   \ 'javascript': ['eslint', 'prettier'],
  "   \ 'javascriptreact': ['eslint', 'prettier'],
  "   \ 'css': ['eslint', 'prettier'],
  "   \ 'sass': ['eslint', 'prettier'],
  "   \ 'html': ['eslint', 'prettier'],
  "   \ 'json': ['eslint', 'prettier'],
  "   \ 'markdown': ['eslint', 'prettier'],
  "   \ 'html.handlebars': ['eslint', 'prettier']
  " \}
  " let g:ale_fixers={
  " \ 'javascript': ['eslint', 'prettier'],
  " \ 'javascriptreact': ['eslint', 'prettier'],
  " \ 'css': ['eslint', 'prettier'],
  " \ 'sass': ['eslint', 'prettier'],
  " \ 'html': ['eslint', 'prettier'],
  " \ 'json': ['eslint', 'prettier'],
  " \ 'markdown': ['eslint', 'prettier'],
  " \ 'html.handlebars': ['eslint', 'prettier']
  " \}
  " "}}}
  Plug 'alvan/vim-closetag' " {{{
  let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,html.handlebars'
  let g:closetag_emptyTags_caseSensitive = 1
  let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
  let g:closetag_shortcut = '>'
  " Add > at current position without closing the current tag, default is ''
  let g:closetag_close_shortcut = '<leader>>' "}}}
  Plug 'dbakker/vim-projectroot' "{{{
  function! <SID>AutoProjectRootCD()
    try
      if &ft != 'help'
        ProjectRootCD
      endif
    catch
    endtry
  endfunction
  autocmd BufEnter * call <SID>AutoProjectRootCD()
  "}}}
  Plug 'jcherven/jummidark.vim' ", {'branch': 'testing'}
  Plug 'hail2u/vim-css3-syntax'
  Plug 'mattn/emmet-vim'
  let g:user_emmet_leader_key=','
  Plug 'valloric/MatchTagAlways' "{{{
  let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xml' : 1,
    \ 'html.handlebars' : 1,
    \ 'javascript' : 1,
    \ 'javascriptreact' : 1,
  \}
  "}}}
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
  let g:coc_global_extensions=[
    \'coc-tsserver',
    \'coc-json',
    \'coc-css',
    \'coc-scssmodules',
    \'coc-html',
    \'coc-emmet',
    \'coc-python',
    \'coc-yaml',
    \'coc-powershell',
    \'coc-vimlsp',
    \'coc-sh',
    \'coc-sql',
    \'coc-lists',
    \'coc-git',
    \'coc-highlight',
    \'coc-ember',
    \'coc-prettier',
    \'coc-explorer',
    \'coc-marketplace'
    \]
  let g:markdown_fenced_languages=[
    \ 'vim',
    \ 'help'
    \]
  " }}}
call plug#end()

" CoC Configuration {{{
" Vim settings required by CoC
set hidden
set nobackup
set nowritebackup
set updatetime=300
" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Autocommands
autocmd CursorHold * silent call CocActionAsync('highlight')
" Keybindings
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <C-n> coc#refresh()
nmap <Leader>/ :CocCommand explorer<CR>
xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>f <Plug>(coc-format-selected)

" }}}

" Statusline (Builtin) Configuration {{{
" Left alignment for the below customizations
set statusline=
" Current buffer's file path relative to the git project root
set statusline+=\ %f
" Read-only marker
set statusline+=%{!&readonly?'':'\ '}
" Modified marker
set statusline+=%{&modified?'[+]':''}\ 
" Right alignment for the below customizations
set statusline+=%=
" CoC statusline integration
set statusline+=%{coc#status()}\ 
" Current filetype
set statusline+=%y
" Current line number,column number
" set statusline+=%0*\ %l,%2c\ %3p%%\ 
" Current percentage through the file
set statusline+=%3p%%\ 
" End Statusline Config }}}

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

silent! colorscheme jummidark
