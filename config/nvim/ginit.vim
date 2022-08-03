if has("win32")
  GuiFont! DinaRemasterII:h12
  let g:python3_host_prog = 'python.exe'
endif

GuiPopupmenu 0
" GUI Neovim in windows displays garbage in the tabline if GuiTabline is
" set to 0
GuiTabline 1
GuiPopupmenu 0
set guioptions+="ac"
set laststatus=2
set wildmenu
set cpo-=<
set wcm=<C-Z>
map <F4> :emenu <C-Z>
set belloff=all
set guicursor+=a:blinkon0
set termguicolors
