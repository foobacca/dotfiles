if has("autocmd")
  " wrap all autocommands in group and !
  " http://learnvimscriptthehardway.stevelosh.com/chapters/14.html

  augroup focuslost
    autocmd!
    " always save when changing tabs etc
    autocmd FocusLost * :wa
  augroup END

  " Remember last location in file, but not for commit messages.
  " see :help last-position-jump
  augroup lastposition
    autocmd!
    autocmd BufReadPost * if &filetype !~ '^git\c' && line("'\"") > 0 && line("'\"") <= line("$")
      \| exe "normal! g`\"" | endif
  augroup END

  "
  " Setting filetype
  "

  " recognize anything in my .Postponed directory as a news article, and anything
  " at all with a .txt extension as being human-language text [this clobbers the
  " `help' filetype, but that doesn't seem to prevent help from working
  " properly]:
  augroup setfiletype
    autocmd!
    autocmd BufNewFile,BufRead */.Postponed/* setlocal filetype=mail
    autocmd BufNewFile,BufRead *.txt setlocal filetype=human
    autocmd BufNewFile,BufRead *.template setlocal filetype=html

    " Puppet files
    autocmd BufNewFile,BufRead *.pp setlocal ft=puppet

    " Markdown files
    autocmd BufNewFile,BufRead *.md setlocal ft=markdown
    autocmd BufNewFile,BufRead *.mdwn setlocal filetype=markdown

    " less css files
    autocmd BufNewFile,BufRead *.less setlocal ft=less

    autocmd BufNewFile,BufRead admin.py     setlocal filetype=python.django
    autocmd BufNewFile,BufRead urls.py      setlocal filetype=python.django
    autocmd BufNewFile,BufRead models.py    setlocal filetype=python.django
    autocmd BufNewFile,BufRead views.py     setlocal filetype=python.django
    autocmd BufNewFile,BufRead settings.py  setlocal filetype=python.django
    autocmd BufNewFile,BufRead forms.py     setlocal filetype=python.django

  augroup END

  "
  " Settings based on filetype
  "
  augroup filetypesettings
    autocmd!

    " make Python follow PEP8 ( http://www.python.org/dev/peps/pep-0008/ )
    autocmd FileType python setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4

    autocmd FileType puppet,ruby setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2

    " keep tabs in go
    autocmd FileType go setlocal noexpandtab softtabstop=4 tabstop=4 shiftwidth=4

    " in human-language files, automatically format everything at 72 chars:
    autocmd FileType mail,human setlocal formatoptions+=t textwidth=72

    " for C-like programming, have automatic indentation:
    autocmd FileType c,cpp,slang setlocal cindent

    " for actual C (not C++) programming where comments have explicit end
    " characters, if starting a new line in the middle of a comment automatically
    " insert the comment leader characters:
    autocmd FileType c setlocal formatoptions+=ro

    " for Perl programming, have things in braces indenting themselves:
    autocmd FileType perl setlocal smartindent

    " for HTML, generally format text, but if a long line has been created leave it
    " alone when editing:
    autocmd FileType html,htmldjango setlocal formatoptions+=tl expandtab softtabstop=2 tabstop=2 shiftwidth=2

    autocmd FileType javascript setlocal expandtab softtabstop=4 tabstop=4 shiftwidth=4

    " for HTML, generally format text, but if a long line has been created leave it
    " alone when editing:
    autocmd FileType php setlocal formatoptions+=tl expandtab softtabstop=2 tabstop=2 shiftwidth=2

    " for both CSS and HTML, use genuine tab characters for indentation, to make
    " files a few bytes smaller:
    autocmd FileType css setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2 smartindent

    autocmd FileType rst setlocal expandtab softtabstop=2 tabstop=2 shiftwidth=2 smartindent

    " in makefiles, don't expand tabs to spaces, since actual tab characters are
    " needed, and have indentation at 8 chars to be sure that all indents are tabs
    " (despite the mappings later):
    autocmd FileType make setlocal noexpandtab shiftwidth=8

    " for man pages don't show line numbers
    autocmd FileType man setlocal nonumber
  augroup END

  augroup orgmode
    autocmd!
    " ORG mode stuff
    autocmd! BufRead,BufWrite,BufWritePost,BufNewFile *.org
    autocmd BufEnter *.org call org#SetOrgFileType()
  augroup END

endif

