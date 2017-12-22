set nocompatible
filetype off

" vim-plug stuff
call plug#begin('~/.vim/plugged')

"Add your bundles here

" Colours
Plug 'altercation/vim-colors-solarized'
Plug 'bitterjug/vim-colors-freyr'

" syntax highlighting
Plug 'vim-scripts/django.vim'
Plug 'tpope/vim-haml'
Plug 'tpope/vim-markdown'
Plug 'ajf/puppet-vim'
Plug 'tpope/vim-git'
Plug 'timcharper/textile.vim'
Plug 'vim-scripts/csv.vim'
Plug 'vim-ruby/vim-ruby'
Plug 'jnwhiteh/vim-golang'
Plug 'kchmck/vim-coffee-script'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'jelera/vim-javascript-syntax'
Plug 'pangloss/vim-javascript'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shutnik/jshint2.vim'
Plug 'chase/vim-ansible-yaml'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'groenewege/vim-less'
Plug 'ekalinin/Dockerfile.vim'
Plug 'martinda/Jenkinsfile-vim-syntax'
Plug 'hashivim/vim-terraform'

" status line
Plug 'bling/vim-airline'
Plug 'lambdatoast/elm.vim'

" functional plugins
" syntax checkers
Plug 'scrooloose/syntastic'
" python stuff
Plug 'klen/python-mode'
Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/Tagbar'
"Plugin 'tmhedberg/SimpylFold'  " might play with this one day
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'jbking/vim-pep8'
" git (and merge)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sjl/threesome.vim'
Plug 'gregsexton/gitv'
" manage buffers and windows
Plug 'vim-scripts/ZoomWin'
Plug 'jeetsukumaran/vim-buffergator'
" Plugin 'rgarver/Kwbd.vim'
Plug 'sjl/clam.vim'
Plug 'benmills/vimux'
" manage files etc
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'matthias-guenther/hammer.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
" wordpress
Plug 'vim-scripts/VimRepress'
" editing
Plug 'chrismetcalf/vim-yankring'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
function! BuildYCM(info)
    if a:info.status == 'installed' || a:info.force
        !./install.sh
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
" Plugin 'ervandew/supertab'
Plug 'sjl/gundo.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-repeat'
Plug 'ap/vim-css-color'
Plug 'Lokaltog/vim-easymotion'
Plug 'chrisbra/NrrwRgn'
Plug 'SirVer/ultisnips'
Plug 'bronson/vim-visual-star-search'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-lastpat'
Plug 'terryma/vim-expand-region'

" email
Plug 'guyzmo/notmuch-abook'
" org mode and related
Plug 'hsitz/VimOrganizer'
Plug 'vim-scripts/utl.vim'
Plug 'mattn/calendar-vim'
Plug 'bitterjug/vim-notebook'
" utility
Plug 'mbadran/headlights'

call plug#end()



filetype plugin indent on     " required! 




runtime macros/matchit.vim

" bring in some stuff (from janus originally)
"
source ~/.dotfiles/vim/abbrev.vim
source ~/.dotfiles/vim/gui_settings.vim
source ~/.dotfiles/vim/mappings.vim
source ~/.dotfiles/vim/python.vim
source ~/.dotfiles/vim/settings.vim
source ~/.dotfiles/vim/statusline.vim
" do autocmds last to do filetype override of other config
source ~/.dotfiles/vim/autocmds.vim

" ConqueTerm
"nmap <Leader>ct :ConqueTerm bash --login<CR>

" enable powerline
set rtp+=~/.vim/bundle/powerline/powerline/bindings/vim

" stuff to work with YankRing
nmap <Leader>yr :YRShow<CR>

" plugin specific stuff
"
" ORG Mode
let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

" make ack work on ubuntu
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

" NERD tree
nmap <Leader>n :NERDTreeToggle<cr>
