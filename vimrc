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
call vundle#rc()
Bundle 'gmarik/vundle'

"Add your bundles here

" Colours
Bundle 'altercation/vim-colors-solarized'
Bundle 'bitterjug/vim-colors-freyr'

" syntax highlighting
Bundle 'vim-scripts/django.vim'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'ajf/puppet-vim'
Bundle 'tpope/vim-git'
Bundle 'timcharper/textile.vim'
Bundle 'vim-scripts/csv.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'jnwhiteh/vim-golang'
Bundle 'kchmck/vim-coffee-script'
Bundle 'evanmiller/nginx-vim-syntax'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'Shutnik/jshint2.vim'
Bundle 'groenewege/vim-less'
" status line
Bundle 'bling/vim-airline'

" functional plugins
" syntax checkers
Bundle 'scrooloose/syntastic'
" python stuff
Bundle 'klen/python-mode'
Bundle 'davidhalter/jedi-vim'
"Bundle 'jbking/vim-pep8'
" git (and merge)
Bundle 'tpope/vim-fugitive'
Bundle 'airblade/vim-gitgutter'
Bundle 'sjl/threesome.vim'
" manage buffers and windows
Bundle 'vim-scripts/ZoomWin'
Bundle 'jeetsukumaran/vim-buffergator'
" Bundle 'rgarver/Kwbd.vim'
Bundle 'sjl/clam.vim'
Bundle 'benmills/vimux'
" manage files etc
Bundle 'scrooloose/nerdtree'
Bundle 'kien/ctrlp.vim'
Bundle 'matthias-guenther/hammer.vim'
Bundle 'mileszs/ack.vim'
" wordpress
Bundle 'vim-scripts/VimRepress'
" editing
Bundle 'chrismetcalf/vim-yankring'
Bundle 'tpope/vim-unimpaired'
Bundle 'scrooloose/nerdcommenter'
Bundle 'ervandew/supertab'
Bundle 'sjl/gundo.vim'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-repeat'
Bundle 'ap/vim-css-color'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'chrisbra/NrrwRgn'
Bundle 'SirVer/ultisnips'
Bundle 'bronson/vim-visual-star-search'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-lastpat'
" email
Bundle "guyzmo/notmuch-abook"
" org mode and related
Bundle 'hsitz/VimOrganizer'
Bundle 'vim-scripts/utl.vim'
Bundle 'mattn/calendar-vim'
Bundle 'bitterjug/vim-notebook'
" utility
Bundle 'mbadran/headlights'


"...All your other bundles...

if iCanHazVundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :BundleInstall
endif

filetype plugin indent on     " required! 

runtime macros/matchit.vim

" Setting up Vundle - the vim plugin bundler end

"
" bring in some stuff (from janus originally)
"
source ~/.dotfiles/vim/abbrev.vim
source ~/.dotfiles/vim/gui_settings.vim
source ~/.dotfiles/vim/mappings.vim
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