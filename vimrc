set nocompatible
filetype off


" from http://www.erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/
" Setting up Vundle - the vim plugin bundler
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
    echo "Installing Vundle.."
    echo ""
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
    let iCanHazVundle=0
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#begin()
Plugin 'gmarik/vundle'

"Add your bundles here

" Colours
Plugin 'altercation/vim-colors-solarized'
Plugin 'bitterjug/vim-colors-freyr'

" syntax highlighting
Plugin 'vim-scripts/django.vim'
Plugin 'tpope/vim-haml'
Plugin 'tpope/vim-markdown'
Plugin 'ajf/puppet-vim'
Plugin 'tpope/vim-git'
Plugin 'timcharper/textile.vim'
Plugin 'vim-scripts/csv.vim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'jnwhiteh/vim-golang'
Plugin 'kchmck/vim-coffee-script'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'pangloss/vim-javascript'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Shutnik/jshint2.vim'
Plugin 'groenewege/vim-less'
" status line
Plugin 'bling/vim-airline'

" functional plugins
" syntax checkers
Plugin 'scrooloose/syntastic'
" python stuff
Plugin 'klen/python-mode'
Plugin 'davidhalter/jedi-vim'
Plugin 'vim-scripts/Tagbar'
"Plugin 'tmhedberg/SimpylFold'  " might play with this one day
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'jbking/vim-pep8'
" git (and merge)
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'sjl/threesome.vim'
Plugin 'gregsexton/gitv'
" manage buffers and windows
Plugin 'vim-scripts/ZoomWin'
Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'rgarver/Kwbd.vim'
Plugin 'sjl/clam.vim'
Plugin 'benmills/vimux'
" manage files etc
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'matthias-guenther/hammer.vim'
Plugin 'mileszs/ack.vim'
Plugin 'rking/ag.vim'
" wordpress
Plugin 'vim-scripts/VimRepress'
" editing
Plugin 'chrismetcalf/vim-yankring'
Plugin 'tpope/vim-unimpaired'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'ervandew/supertab'
Plugin 'sjl/gundo.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-repeat'
Plugin 'ap/vim-css-color'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'chrisbra/NrrwRgn'
Plugin 'SirVer/ultisnips'
Plugin 'bronson/vim-visual-star-search'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-lastpat'
Plugin 'terryma/vim-expand-region'

" email
Plugin 'guyzmo/notmuch-abook'
" org mode and related
Plugin 'hsitz/VimOrganizer'
Plugin 'vim-scripts/utl.vim'
Plugin 'mattn/calendar-vim'
Plugin 'bitterjug/vim-notebook'
" utility
Plugin 'mbadran/headlights'


"...All your other bundles...

if iCanHazVundle == 0
    echo "Installing Plugins, please ignore key map error messages"
    echo ""
    :PluginInstall
endif

call vundle#end()

filetype plugin indent on     " required! 

runtime macros/matchit.vim

" Setting up Vundle - the vim plugin bundler end

"
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
