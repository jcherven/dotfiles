" nvim basic settings {{{
set nocompatible
set directory^=$HOME/.vim/tmp//
set encoding=utf-8
set fileformats=unix,dos,mac
set lazyredraw
set clipboard+=unnamedplus
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
" set expandtab
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
" set splitbelow
" set splitright
set eadirection=both
set equalalways
set foldmethod=marker
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
autocmd FileType help setlocal colorcolumn=80
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
  " automatically reload changed files
  Plug 'djoshea/vim-autoread'
  " " A color theme
  Plug 'jcherven/jummidark.vim', {'branch': 'testing'}
  " insert or delete brackets in matching pairs
  Plug 'jiangmiao/auto-pairs'
  " update and install plugins within vim
  Plug 'junegunn/vim-plug'
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
  Plug 'nvim-treesitter/nvim-treesitter'
  " orgmode implementation for neovim
  Plug 'nvim-orgmode/orgmode'
  " it's emmet
  Plug 'mattn/emmet-vim' "{{{
    let g:user_emmet_leader_key=','
  " }}}
  " customizes tab labels with useful information
  Plug 'gcmt/taboo.vim' "{{{
    let g:taboo_tabline=1
    let g:taboo_modified_tab_flag="[+]"
    fun! GitInfo()
    let git = fugitive#head()
    if git != ''
      return ''.git.''
    else
      return ''
    endif
    endfunction
    let g:taboo_tab_format="|%N %P%m (git:%{GitInfo()})|"
    let g:taboo_renamed_tab_format="|%N %l%m (git:%{GitInfo()})|"
  "}}}
  " automatically closes html/xml/jsx/hbs tags
  Plug 'alvan/vim-closetag' " {{{
    let g:closetag_filetypes = 'html,xhtml,phtml,javascript,javascriptreact,html.handlebars'
    let g:closetag_emptyTags_caseSensitive = 1
    let g:closetag_regions = {
      \ 'typescript.tsx': 'jsxRegion,tsxRegion',
      \ 'javascript.jsx': 'jsxRegion',
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
    \}
    "}}}
  " coc is to vim as evil mode is to emacs
  Plug 'neoclide/coc.nvim', {'branch': 'release'} "{{{
    let g:coc_global_extensions=[
      \'coc-css',
      \'coc-cssmodules',
      \'coc-ember',
      \'coc-emmet',
      \'coc-explorer',
      \'coc-git',
      \'coc-highlight',
      \'coc-html',
      \'coc-json',
      \'coc-lists',
      \'coc-markdownlint',
      \'coc-prettier',
      \'coc-pyright',
      \'coc-sh',
      \'coc-snippets',
      \'coc-sql',
      \'coc-tag',
      \'coc-tailwindcss',
      \'coc-tsserver',
      \'coc-vimlsp',
      \'coc-yaml',
      \'coc-eslint',
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

" Commands
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" COC KEYBINDS {{{
" initiates autocomplete menu
inoremap <silent><expr> <C-n> coc#refresh()

" provides a file browser tree
nmap <Leader>/ :CocCommand explorer --sources=file+<CR>

" provides a buffer list browser
nmap <Leader>b :CocCommand explorer --sources=buffer+<CR>
nmap <Leader>l :CocList<CR>
xmap <Leader>f <Plug>(coc-format-selected)
nmap <Leader>f <Plug>(coc-format-selected)

" goto things{{{
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" }}}

" coc-snippets bindings{{{
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? coc#_select_confirm() :
"       \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
"
" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction
"
" let g:coc_snippet_next = '<tab>'
"}}}

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

" nvim-orgmode{{{
lua << EOF

-- Load custom treesitter grammar for org filetype
require('orgmode').setup_ts_grammar()

-- treesitter configuration
require'nvim-treesitter.configs'.setup {
  -- if ts highlights are not enabled at all, or disabled bta `disable` prop, highlighting will fall back to the default vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- remove this to use ts highlighter for some of the highlights (experiemental)
    additional_vim_regex_highlighting = {'org'}, --required since ts highlighter doesn't support all syntax features like conceal
    },
ensure_installed = {'org'},
  }

require('orgmode').setup({
org_agenda_files = {'~/Documents/org/*'},
org_default_notes_file = '~/Documents/org/nvimorg.org'
})
EOF
" }}}

" set termguicolors
colorscheme jummidark

" hi! InactiveWindow ctermfg=245 ctermbg=237 cterm=NONE guifg=#8a8a8a guibg=#3a3a3a gui=NONE
" augroup WindowManagement
"   autocmd!
"   autocmd WinEnter * call Handle_Win_Enter()
" augroup END
"
" function! Handle_Win_Enter()
"   setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
" endfunction
