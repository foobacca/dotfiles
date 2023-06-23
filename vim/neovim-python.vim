""
"" neovim settings
""
if has('nvim')

    " set which python to use
    if filereadable('/home/hamish/.virtualenvs/neovim2/bin/python')
        let g:python_host_prog = '/home/hamish/.virtualenvs/neovim2/bin/python'
    endif
    if filereadable('/home/hamish/.virtualenvs/neovim3/bin/python')
        let g:python3_host_prog = '/home/hamish/.virtualenvs/neovim3/bin/python'
    endif

    if filereadable('/Users/hdowner/.virtualenvs/neovim2/bin/python')
        let g:python_host_prog = '/Users/hdowner/.virtualenvs/neovim2/bin/python'
    endif
    if filereadable('/Users/hdowner/.virtualenvs/neovim3/bin/python')
        let g:python3_host_prog = '/Users/hdowner/.virtualenvs/neovim3/bin/python'
    endif

    if filereadable('/home/hdowner/envs/neovim2/bin/python')
        let g:python_host_prog = '/home/hdowner/envs/neovim2/bin/python'
    endif
    if filereadable('/home/hdowner/envs/neovim3/bin/python')
        let g:python3_host_prog = '/home/hdowner/envs/neovim3/bin/python'
    endif
endif

