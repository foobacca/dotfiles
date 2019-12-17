set nocompatible
filetype off

" do neovim python bits first
source ~/.dotfiles/vim/neovim-python.vim

" vim-plug stuff
call plug#begin('~/.vim/plugged')

"Add your bundles here

" Colours
" Plug 'altercation/vim-colors-solarized'
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'bitterjug/vim-colors-freyr'
"
" status line
Plug 'bling/vim-airline'
Plug 'lambdatoast/elm.vim'


" syntax highlighting
Plug 'vim-scripts/django.vim'
Plug 'tpope/vim-haml', {'for': 'haml'}
" Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'ajf/puppet-vim', {'for': 'puppet'}
Plug 'tpope/vim-git'
Plug 'timcharper/textile.vim', {'for': 'textile'}
Plug 'vim-scripts/csv.vim'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'jnwhiteh/vim-golang', {'for': 'golang'}
Plug 'jelera/vim-javascript-syntax', {'for': 'javascript'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Shutnik/jshint2.vim', {'for': 'javascript'}
Plug 'chase/vim-ansible-yaml', {'for': 'ansible'}
Plug 'Glench/Vim-Jinja2-Syntax', {'for': 'jinja'}
Plug 'groenewege/vim-less', {'for': 'less'}
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'martinda/Jenkinsfile-vim-syntax', {'for': 'Jenkinsfile'}
Plug 'hashivim/vim-terraform', {'for': 'terraform'}
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'cespare/vim-toml'
Plug 'posva/vim-vue', {'for': 'vue'}

" git (and merge)
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'sjl/threesome.vim'
Plug 'gregsexton/gitv'

" functional plugins
" syntax checkers
Plug 'scrooloose/syntastic'
" completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" python stuff
Plug 'zchee/deoplete-jedi'
Plug 'klen/python-mode', {'branch': 'develop'}
" Plug 'davidhalter/jedi-vim'
Plug 'vim-scripts/Tagbar'

"Plugin 'tmhedberg/SimpylFold'  " might play with this one day
"Plugin 'xolox/vim-misc'
"Plugin 'xolox/vim-easytags'
"Plugin 'jbking/vim-pep8'
" manage buffers and windows
" Plug 'vim-scripts/ZoomWin' - seems broken
Plug 'jeetsukumaran/vim-buffergator'
" Plugin 'rgarver/Kwbd.vim'
Plug 'sjl/clam.vim'
Plug 'benmills/vimux'
" manage files etc
Plug 'scrooloose/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'mileszs/ack.vim'
Plug 'rking/ag.vim'
" wordpress
Plug 'vim-scripts/VimRepress'
" editing
Plug 'chrismetcalf/vim-yankring'
Plug 'tpope/vim-unimpaired'
Plug 'scrooloose/nerdcommenter'
" distraction free editing
Plug 'junegunn/goyo.vim'

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

" email - python 2 only
" Plug 'guyzmo/notmuch-abook'
" org mode and related
Plug 'hsitz/VimOrganizer'
Plug 'vim-scripts/utl.vim'
Plug 'mattn/calendar-vim'
Plug 'bitterjug/vim-notebook'
" utility - python 2 only
" Plug 'mbadran/headlights'

if isdirectory(expand("~/.fzf"))
    Plug "~/.fzf"
endif

call plug#end()



filetype plugin indent on     " required! 




runtime macros/matchit.vim

" bring in some stuff (from janus originally)
"

source ~/.dotfiles/vim/abbrev.vim
source ~/.dotfiles/vim/gui_settings.vim
source ~/.dotfiles/vim/mappings.vim
" source ~/.dotfiles/vim/python.vim
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
