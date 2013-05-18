""
"" Basic Setup
""

set nocompatible      " Use vim, no vi defaults
set number            " Show line numbers
set ruler             " Show line and column number
syntax enable         " Turn on syntax highlighting allowing local overrides
set encoding=utf-8    " Set default encoding to UTF-8

""
"" Whitespace
""

set nowrap                        " don't wrap lines
set tabstop=4                     " a tab is two spaces
set softtabstop=4                     " a tab is two spaces
set shiftwidth=4                  " an autoindent (with <<) is two spaces
set expandtab                     " use spaces, not tabs
set list                          " Show invisible characters
set backspace=indent,eol,start    " backspace through everything in insert mode

" List chars
" set list listchars=tab:▸\ ,eol:¬,trail:·
set listchars=""                  " Reset the listchars
set listchars=tab:▸\             " tab should show as '▸ '
set listchars+=trail:·            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen

""
"" Searching
""

set hlsearch    " highlight matches
set ignorecase  " searches are case insensitive...
set smartcase   " ... unless they contain at least one capital letter
set incsearch   " incremental searching
set gdefault    " assume the /g flag on :s substitutions to replace all matches in a line

""
"" Wild settings
""

" Investigate the precise meaning of these settings
set wildmode=list:longest,list:full

" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*

""
"" Backup and swap files
""

set backupdir=~/.vim/_backup//    " where to put backup files.
set directory=~/.vim/_temp//      " where to put swap files.

" Search & Replace
set autoindent

" keep a few lines beneath the cursor
set scrolloff=3

" more natural split opening
set splitbelow
set splitright

" * Keystrokes -- Moving Around

" have the h and l cursor keys wrap between lines (like <Space> and <BkSpc> do
" by default), and ~ covert case over line breaks; also have the cursor keys
" wrap in insert mode:
set whichwrap=h,l,~,[,]

" and set the colours so it's not too in your face
highlight NonText cterm=NONE ctermfg=brown
highlight SpecialKey cterm=NONE ctermfg=Green
highlight NonText guifg=#804C00
highlight SpecialKey guifg=#804C00

" make spelling highlight readable
highlight SpellBad term=reverse ctermbg=black ctermfg=green

" allow vim to be the man pager
let $PAGER=''

" Set region to British English
set spelllang=en_gb

" try to avoid misspelling words in the first place -- have the insert mode
" <Ctrl>+N/<Ctrl>+P keys perform completion on partially-typed words by
" checking the Linux word list and the personal `Ispell' dictionary; sort out
" case sensibly (so that words at starts of sentences can still be completed
" with words that are in the dictionary all in lower case):
set complete=.,w,k
set infercase


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" settings for plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" PYTHON MODE

" Rope
" Go to definition in a new buffer: horizontal split
let g:pymode_rope_goto_def_newwin='new'

" nerdtree - ignore pyc
let NERDTreeIgnore = ['\.pyc$']

" Pymode:Lint
let g:pymode_lint_ignore="E126,E128,E501"

let g:pymode_folding = 0
let g:pymode_syntax_space_errors = 0
let g:pymode_utils_whitespace = 0
