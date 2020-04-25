set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
set lazyredraw
set clipboard=unnamed
set backspace=indent,eol,start
set showtabline=2
" set noshowmode
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
  " Only show the cursorline in the active window {{{
augroup CursorLineOnlyInActiveWindow
autocmd!
autocmd VimEnter,WinEnter,BufWinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
augroup END
" }}}
set scrolloff=8
set splitbelow
set splitright
set eadirection=both
set equalalways
set foldmethod=marker

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

" Use in a conditional statement to check if a plugin is installed
" if PlugLoaded('plugin-name') do something endif
function PlugLoaded(name)
  return (
    \ has_key(g:plugs, a:name) &&
    \ isdirectory(g:plugs[a:name].dir) &&
    \ stridx(&rtp, g:plugs[a:name].dir >= 0))
endfunction

call plug#begin('~/.vim/plugged')
  Plug 'junegunn/vim-plug'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'jeffKreeftmeijer/vim-numbertoggle'
  Plug 'tpope/vim-fugitive'
  fun! GitInfo()
    let git = fugitive#head()
    if git != ''
      return ' '.git.''
    else
      return ''
    endif
  endfunction
  Plug 'tpope/vim-surround'
  Plug 'tomtom/tcomment_vim'
  Plug 'gcmt/taboo.vim'
  let g:taboo_tabline=1
  let g:taboo_modified_tab_flag="[+]"
  let g:taboo_tab_format="▏%N:%P%m %{GitInfo()}▕"
  let g:taboo_renamed_tab_format="▏%N:%l%m %{GitInfo()}▕"
  Plug 'sheerun/vim-polyglot'
  Plug 'dense-analysis/ale' "{{{
  let g:ale_fix_on_save=1
  let g:ale_linters_explicit=1
  let g:ale_javascript_prettier_options='--single-quote'
  let g:ale_linters={
    \ 'javascript': ['prettier'],
    \ 'javascriptreact': ['prettier'],
    \ 'css': ['prettier'],
    \ 'sass': ['prettier'],
    \ 'html': ['prettier'],
    \ 'json': ['prettier'],
    \ 'markdown': ['prettier']
  \}
  let g:ale_fixers={
    \ 'javascript': ['prettier'],
    \ 'javascriptreact': ['prettier'],
    \ 'css': ['prettier'],
    \ 'sass': ['prettier'],
    \ 'html': ['prettier'],
    \ 'json': ['prettier'],
    \ 'markdown': ['prettier']
  \}
  "}}}
  Plug 'scrooloose/nerdtree' "{{{
    " Function for smart NERDTree toggle behavior.
    " Call on the NERDTree toggle keybinding.
    " Performs NERDTreeFind on open, toggles the buffer on close.
    function! NERDTreeFindToggle()
      if exists("g:NERDTree") && g:NERDTree.IsOpen()
	NERDTreeClose
      elseif filereadable(expand('%'))
	NERDTreeFind
      else
	NERDTree
      endif
    endfunction
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    map <leader>/ :call NERDTreeFindToggle()<CR>
    let g:NERDTreeMapJumpParent = "h"
    let g:NERDTreeMapActivateNode = "l"
    let NERDTreeMinimalUI=1
    let g:NERDTreeWinPos = "left"
    let g:NERDTreeShowLineNumbers=1
    let g:NERDTreeDirArrows=1
    let g:NERDTreeAutoDeleteBuffer=1
    let g:NERDTreeShowHidden=1
    let g:NERDTreeSortHiddenFirst=1
    let g:NERDTreeQuitOnOpen=1
    let g:NERDTreeStatusline="| menu:m | help:? |"
    Plug 'Xuyuanp/nerdtree-git-plugin'
  "}}}
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'sickill/vim-pasta'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'psliwka/vim-smoothie'
  Plug 'djoshea/vim-autoread'
  Plug 'alvan/vim-closetag' " {{{
  let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact'
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
  Plug 'chrisbra/Colorizer'
  Plug 'jcherven/jummidark.vim'
  " Plug '~/Desktop/jummidark.vim'
  " Conditionally load these on markup files
  let markupFiles = ['html', 'javascript', 'javascriptreact', 'xml', 'css', 'scss']
  Plug 'hail2u/vim-css3-syntax', { 'for': markupFiles }
  Plug 'cakebaker/scss-syntax.vim', { 'for': markupFiles }
  Plug 'AndrewRadev/tagalong.vim', { 'for': markupFiles }
  Plug 'jiangmiao/auto-pairs', { 'for': markupFiles }
  Plug 'mattn/emmet-vim', { 'for': markupFiles }
  let g:user_emmet_leader_key=','
  " Code completion. See github.com/neoclide/coc.nvim/wiki/ for usage help {{{
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions=[
    \'coc-json',
    \'coc-tsserver',
    \'coc-css',
    \'coc-html',
    \'coc-emmet',
    \'coc-python',
    \'coc-highlight',
    \'coc-yaml',
    \'coc-markdownlint',
    \'coc-powershell',
    \'coc-vimlsp'
    \]
  let g:markdown_fenced_languages = [
    \ 'vim',
    \ 'help'
    \]
  Plug 'weirongxu/coc-explorer', {'do': 'yarn install --frozen-lockfile'}
  " Plug 'iamcco/coc-vimlsp', {'do': 'yarn install --frozen-lockfile'}
  " }}}
call plug#end()

" Statusline (Builtin) Configuration {{{
" Left alignment for the below customizations
set statusline=
" Current buffer's file path relative to the git project root
set statusline+=\ %f
" Modifiable marker
set statusline+=%{!&readonly?'':'\ '}
" Read-Only marker
" set statusline+=%{!&readonly?'':'\ '}
" Modified marker
set statusline+=%{&modified?'[+]':''}\ 
" CoC statusline integration
set statusline+=%{coc#status()}\ 
" Right alignment for the below customizations
set statusline+=%=
" Current filetype
set statusline+=%y
" Current line number,column number
" set statusline+=%0*\ %l,%2c\ %3p%%\ 
" Current percentage through the file
set statusline+=%3p%%\ 
" End Statusline Config }}}

" CoC settings for vim/nvim {{{
" These settings break nvim when placed inside the plug call, keep them
" separately down here
set hidden
set nobackup
set nowritebackup
set updatetime=300
" These are optional
set cmdheight=2
set shortmess+=c
set signcolumn=no
highlight CocCodeLens ctermfg=8 guifg=#4e4e4e
" Adds a command :Prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')
" }}}

" GUI vim (macvim, gvim, etc) Settings {{{
if has('gui')
  set belloff=all
  set guifont=Iosevka\ Term:h14
  set guicursor+=a:blinkon0
  set linespace=-1
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
