" ex: foldmethod=marker

" nvim basic settings {{{
set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
" set fileformats=unix,dos,mac
set lazyredraw
set clipboard+=unnamedplus "{{{
" easy 2-way clipboard in windows wsl or gvim
" depends on win32yank.exe in $PATH (github.com/equalsraf/win32yank)
if has('wsl' && executable('win32yank.exe')) 
  let g:clipboard = {
        \'name': 'win32yank-wsl',
        \'copy': {
          \'+': 'win32yank.exe -i --crlf',
          \'*': 'win32yank.exe -i --crlf',
        \},
        \'paste': {
          \'+': 'win32yank.exe -o --lf',
          \'*': 'win32yank.exe -o --lf',
        \},
        \'cache_enabled': 0,
  \}
endif
"}}}
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
set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4
set autoindent
set smartindent
set linebreak
set breakindent
set showbreak=↪
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
set foldmethod=syntax
set relativenumber
" }}}

" System conditional settings {{{
" On WSL Gentoo nvim wants to see this set according to :checkhealth
let g:python3_host_prog="/usr/bin/python"
" sets the default shell to homebrew's bash if installed
" if has('macunix')
"   set shell=/usr/local/bin/bash\ --rcfile\ ~/.bash_profile
" endif

" Filetype specific settings
" autocmd FileType help setlocal colorcolumn=80
" }}}

" Keybindings {{{
" additional keybindings are defined in the CoC settings

nnoremap <space> :

" Leader keybindings
map ; <Leader>
let mapleader = ";"
nmap <Leader>ts i<C-R>=strftime("%Y-%m-%d %I:%M %p")<CR><esc>

" Ctrl keybindings
nnoremap <C-J> <C-w><C-J>
nnoremap <C-K> <C-w><C-K>
nnoremap <C-L> <C-w><C-L>
nnoremap <C-H> <C-w><C-H>
set mouse=a
" }}}

" vim-plug {{{
call plug#begin('~/.vim/plugged')
  " automatically renames closing html/xml tags
  Plug 'AndrewRadev/tagalong.vim'
  " preview colors in vim
  Plug 'chrisbra/colorizer'
  " emacs-like cursor beacon
  Plug 'DanilaMihailov/beacon.nvim'
  " automatically reload changed files
  Plug 'djoshea/vim-autoread'
  " golang development environment
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  " A color theme
  " Plug 'jcherven/jummidark.vim', {'branch': 'main'}
  Plug '~/Projects/jummidark.vim', {'branch': 'testing'}
  " insert or delete brackets in matching pairs
  Plug 'jiangmiao/auto-pairs'
  " let g:AutoPairs['{%']='%}'
  " update and install plugins within vim
  Plug 'junegunn/vim-plug'
  " colorscheme modeled after firefox devtools
  Plug 'kjssad/quantum.vim'
  " calendar view and nav in vimwiki
  Plug 'mattn/calendar-vim'
  " color highlighter for nvim in lua
  Plug 'norcalli/nvim-colorizer.lua'
  " automatic loading of syntax highlighting schemes
  Plug 'sheerun/vim-polyglot'
  " smooth line scrolling on page jumps
  Plug 'psliwka/vim-smoothie'
  " paste text with indentation adjusted to the surrounding context
  Plug 'sickill/vim-pasta'
  " comment/uncomment lines with gc
  Plug 'tomtom/tcomment_vim'
  " unix readline bindings in insert and command modes
  Plug 'tpope/vim-rsi'
  " Provides Jinja filetype detection for use by syntax/highlight/snippets plugins
  Plug 'glench/vim-jinja2-syntax'
  " git wrapper for vim
  Plug 'tpope/vim-fugitive'
  " shortcuts for enclosing brackets/text
  Plug 'tpope/vim-surround'
  " required for nvim-orgmode
  " Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " orgmode implementation for neovim
  " Plug 'nvim-orgmode/orgmode'
  " it's emmet. disable when using neovim with coc
  " Plug 'mattn/emmet-vim' "{{{
  "   let g:user_emmet_leader_key=','
  " }}}
  " customizes tab labels with useful information
  Plug 'gcmt/taboo.vim' "{{{
    " enables taboo in gui tabs
    set guioptions-=e
    let g:taboo_tabline=1
    let g:taboo_modified_tab_flag="[+]"
    fun! GitInfo()
    let git = FugitiveHead()
    if git != ''
      return ''.git.''
    else
      return ''
    endif
    endfunction
    let g:taboo_tab_format="|%N %P%m (%{GitInfo()}) "
    let g:taboo_renamed_tab_format="|%N %l%m (%{GitInfo()}) "
    " let g:taboo_tab_format="|%N %f%m (git:%{GitInfo()}) "
    " let g:taboo_renamed_tab_format="|%N %l%m (git:%{GitInfo()}) "
    let g:taboo_unnamed_tab_label="unnamed file"
  "}}}
  " automatically closes html/xml/jsx/hbs tags
  Plug 'alvan/vim-closetag' " {{{
    let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,html.handlebars'
    let g:closetag_emptyTags_caseSensitive = 1
    let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
      \ 'typescriptreact': 'jsxRegion,tsxRegion',
      \ 'javascriptreact': 'jsxRegion',
      \ }
    let g:closetag_shortcut = '>'
    " Add > at current position without closing the current tag, default is ''
    let g:closetag_close_shortcut = '<leader>>'
  "}}}
  " helps vim-fugitive identify the pwd's git project root
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
  " highlights matching html/xml/jsx/hbs tags
  Plug 'valloric/MatchTagAlways' "{{{
    let g:mta_filetypes = {
      \ 'html' : 1,
      \ 'xml' : 1,
      \ 'html.handlebars' : 1,
      \ 'javascript' : 1,
      \ 'javascriptreact' : 1,
      \ 'jinja' : 1,
    \}
    "}}}
  " coc is to vim as evil mode is to emacs
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
    let g:coc_global_extensions=[
      \'coc-angular',
      \'coc-css',
      \'coc-cssmodules',
      \'coc-ember',
      \'coc-emmet',
      \'coc-eslint',
      \'coc-explorer',
      \'coc-git',
      \'coc-go',
      \'coc-highlight',
      \'coc-html',
      \'coc-html-css-support',
      \'coc-htmlhint',
      \'coc-json',
      \'coc-lists',
      \'coc-markdownlint',
      \'coc-perl',
      \'coc-prettier',
      \'coc-pyright',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sql',
      \'coc-tag',
      \'coc-tsserver',
      \'coc-vimlsp',
      \'coc-yaml',
      \]
    let g:markdown_fenced_languages=[
      \ 'vim',
      \ 'help'
      \]
    " }}}
  " for taking/publishing notes
  Plug 'vimwiki/vimwiki' "{{{
    let g:vimwiki_list = [{'path': '$HOME/vimwiki/wiki/', 'path_html': '$HOME/Projects/vimwiki/site', 'autotoc': 1, 'syntax': 'markdown', 'ext': '.md'}]
  "}}}
  " clunky way of using sqlworkbench in vim
  " Plug 'cosminadrianpopescu/vim-sql-workbench' "{{{
  "   let g:sw_exe="/Users/choro/bin/Workbench-Build127-with-optional-libs/sqlwbconsole.sh"
  " "}}}
  " much faster code folding than the builtin folding
  Plug 'Konfekt/FastFold' "{{{
  " nmap zuz <Plug>(FastFoldUpdate)
  " }}}
  " less gregarious indent-style code folding for python files
  Plug 'tmhedberg/SimpylFold' "{{{
  " }}}
  call plug#end()
" }}}

" CoC Configuration {{{
" Vim settings required by CoC
set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set complete-=t

" Let's see if this fixes coc-pyright
autocmd FileType python let b:coc_root_patterns = ['.git', '.env']
" autocmd FileType python set nowrap

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile
command! -nargs=0 Format :call CocAction('format')

" COC KEYBINDS {{{
" initiates autocomplete menu
inoremap <silent><expr> <C-n> coc#refresh()

" provides a file browser tree
nmap <Leader>/ :CocCommand explorer --toggle --sources=file+<CR>

" provides a buffer list browser
nmap <Leader>b :CocCommand explorer --toggle --sources=buffer+<CR>
nmap <Leader>l :CocList<CR>
xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>fa :Format<CR>

" goto things{{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" end of COC KEYBINDS }}}

" end of CoC Configuration }}}

" Statusline (Builtin) Configuration {{{
" Left alignment for the below customizations
set statusline=
" Current file's git status via Fugitive
set statusline+=\ %{FugitiveStatusline()}
" Current buffer's file path relative to the git project root
set statusline+=\ %f
" Read-only marker
set statusline+=%{!&readonly?'':'\ [RO]'}
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
" }}}

" source "./prototype-init.lua"

colorscheme quantum
if colors_name=='quantum'
    set background=dark
    set termguicolors
    hi Comment gui=NONE
    hi Type gui=BOLD
    hi StorageClass gui=BOLD
    hi jsFuncArgs gui=BOLD
    hi jsThis gui=BOLD
    hi jsSuper gui=BOLD
    hi htmlTagName gui=BOLD
endif
