if has("autocmd")
  " always save when changing tabs etc
  au FocusLost * :wa

  " Treat JSON files like JavaScript
  au BufNewFile,BufRead *.json set ft=javascript

  " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
  au FileType python set expandtab softtabstop=4 tabstop=4 shiftwidth=4

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  au BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g`\"" | endif
  " recognize anything in my .Postponed directory as a news article, and anything
  " at all with a .txt extension as being human-language text [this clobbers the
  " `help' filetype, but that doesn't seem to prevent help from working
  " properly]:
  augroup filetype
    autocmd BufNewFile,BufRead */.Postponed/* set filetype=mail
    autocmd BufNewFile,BufRead *.txt set filetype=human
    autocmd BufNewFile,BufRead *.template set filetype=html
    autocmd BufNewFile,BufRead *.mdwn set filetype=mkd
  augroup END

  " in human-language files, automatically format everything at 72 chars:
  autocmd FileType mail,human set formatoptions+=t textwidth=72

  " for C-like programming, have automatic indentation:
  autocmd FileType c,cpp,slang set cindent

  " for actual C (not C++) programming where comments have explicit end
  " characters, if starting a new line in the middle of a comment automatically
  " insert the comment leader characters:
  autocmd FileType c set formatoptions+=ro

  " for Perl programming, have things in braces indenting themselves:
  autocmd FileType perl set smartindent

  au BufNewFile,BufRead admin.py     setlocal filetype=python.django
  au BufNewFile,BufRead urls.py      setlocal filetype=python.django
  au BufNewFile,BufRead models.py    setlocal filetype=python.django
  au BufNewFile,BufRead views.py     setlocal filetype=python.django
  au BufNewFile,BufRead settings.py  setlocal filetype=python.django
  au BufNewFile,BufRead forms.py     setlocal filetype=python.django

  " for CSS, also have things in braces indented:
  autocmd FileType css set smartindent

  " for HTML, generally format text, but if a long line has been created leave it
  " alone when editing:
  autocmd FileType html set formatoptions+=tl

  " for both CSS and HTML, use genuine tab characters for indentation, to make
  " files a few bytes smaller:
  autocmd FileType html,css set noexpandtab tabstop=2

  " in makefiles, don't expand tabs to spaces, since actual tab characters are
  " needed, and have indentation at 8 chars to be sure that all indents are tabs
  " (despite the mappings later):
  autocmd FileType make set noexpandtab shiftwidth=8

  " for man pages don't show line numbers
  autocmd FileType man set nonumber

  " ORG mode stuff
  au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
  au BufEnter *.org call org#SetOrgFileType()

endif

