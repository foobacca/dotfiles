" include the vimrc
if filereadable(expand("~/.vimrc"))
  source ~/.vimrc
endif

" window size
if hostname() == "fen-desktop3.fen.aptivate.org"
  set lines=63
else
  set lines=50
endif
set columns=110

set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
" You can also specify a different font, overriding the default font
" if has('gui_gtk2')
" set guifont=Inconsolata\ for\ Powerline\ Medium\ 12
" else
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
" endif


colorscheme solarized

" vim: ft=vim
