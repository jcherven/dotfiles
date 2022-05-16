GuiFont! DinaRemasterII:h12
GuiPopupmenu 0
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

if has("win32")
	let &shell='bash.exe'
endif
