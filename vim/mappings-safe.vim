" this is for mappings safe for ideavim and vim (and neovim)
"
" use ; as : - by default ; does repeat of t/T/f/F
"nnoremap ; :

" use space as leader
map <Space> <Leader>

" leave insert mode
inoremap jk <Esc>

" format the entire file
nmap <leader>fef ggVG=

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

" upper/lower first char of word
nmap <leader>U mQgewvU`Q
nmap <leader>L mQgewvu`Q

" previously we used :tabnext and :tabprevious - but ideavim doesn't work with
" that
nmap <C-l> gt
nmap <C-h> gT

nnoremap <leader><space> :noh<cr>   " make it easy to turn off search highlighting

" have the usual indentation keystrokes still work in visual mode:
vnoremap <C-T> >
vnoremap <C-D> <LT>
vmap <Tab> <C-T>
vmap <S-Tab> <C-D>

" have Y behave analogously to D and C rather than to dd and cc (which is
" already done by yy):
nnoremap Y y$

" Visually select the text that was last edited/pasted
nmap gV `[v`]

