" Power line stuff
let g:Powerline_symbols = 'fancy'

if has("statusline") && !&cp
  set laststatus=2  " always show the status bar
  set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

"   " Start the status line
"   set statusline=%f\ %m\ %r
"   set statusline+=Line:%l/%L[%p%%]
"   set statusline+=Col:%v
"   set statusline+=Buf:#%n
"   set statusline+=[%b][0x%B]
endif
