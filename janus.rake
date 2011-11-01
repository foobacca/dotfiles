# vi: set ft=ruby

# pyflakes for python errors
# might also want to do: sudo pip install -e git+git://github.com/kevinw/pyflakes.git#egg=Package
vim_plugin_task "pyflakes", "git://github.com/kevinw/pyflakes-vim.git"

# exploring buffers
vim_plugin_task "minibufexpl", "git://github.com/fholgado/minibufexpl.vim.git"
#vim_plugin_task "bufexplorer", "git://github.com/edsono/vim-bufexplorer.git"

# managing yanks (copy/paste buffers)
vim_plugin_task "yankring", "git://github.com/chrismetcalf/vim-yankring.git"
