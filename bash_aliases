# aliases ...
# vi: ft=sh

alias vimcheat='eog file:///home/mish/Desktop/vi-vim-cheat-sheet.gif'

alias p4='ping 4.2.2.2 -c 4'
alias t4='traceroute -n 4.2.2.2'
alias p1='ping 192.168.1.1 -c 4'

# ssh
alias mailao='ssh -t mail.aptivate.org tmux attach -d'
alias socks='ssh -C -D 1080 lin-vnc.aptivate.org'
alias heltun='ssh -f hamish -L 8042:hamish:8042 -N'

# pwsafe
alias pw='pwsafe -p'

# sup
alias sup='SUP_LOG_LEVEL=debug ruby -I /home/mish/dev/sup/mainline/lib -w /home/mish/dev/sup/mainline/bin/sup'
alias sup-add='SUP_LOG_LEVEL=debug ruby -I /home/mish/dev/sup/mainline/lib -w /home/mish/dev/sup/mainline/bin/sup-add'
alias sup-config='SUP_LOG_LEVEL=debug ruby -I /home/mish/dev/sup/mainline/lib -w /home/mish/dev/sup/mainline/bin/sup-config'
alias sup-dump='SUP_LOG_LEVEL=debug ruby -I /home/mish/dev/sup/mainline/lib -w /home/mish/dev/sup/mainline/bin/sup-dump'
alias sup-sync='SUP_LOG_LEVEL=debug ruby -I /home/mish/dev/sup/mainline/lib -w /home/mish/dev/sup/mainline/bin/sup-sync'

alias heliotrope-add='ruby1.9.1 -I /home/mish/dev/sup/heliotrope/lib /home/mish/dev/sup/heliotrope/bin/heliotrope-add'
alias heliotrope-console='ruby1.9.1 -I /home/mish/dev/sup/heliotrope/lib /home/mish/dev/sup/heliotrope/bin/heliotrope-console'
alias heliotrope-import='ruby1.9.1 -I /home/mish/dev/sup/heliotrope/lib /home/mish/dev/sup/heliotrope/bin/heliotrope-import'
alias heliotrope-server='ruby1.9.1 -I /home/mish/dev/sup/heliotrope/lib /home/mish/dev/sup/heliotrope/bin/heliotrope-server'
alias turnsole='TURNSOLE_LOG_LEVEL=debug ruby1.9.1 -I /home/mish/dev/sup/turnsole/lib -I /home/mish/dev/sup/heliotrope/lib /home/mish/dev/sup/turnsole/bin/turnsole'

#alias ruboto='jruby -I /usr/lib/jruby/lib/ruby/gems/1.8/gems/ruboto-core-0.1.0/lib /usr/lib/jruby/lib/ruby/gems/1.8/gems/ruboto-core-0.1.0/bin/ruboto'

# some more ls aliases
alias ll='ls -l'
alias lh='ls -lh'
alias llh='ls -lh'
alias la='ls -A'
alias l='ls -CF --hide=*.pyc'
alias lt='ls -laptr' #oldest first sort
alias labc='ls -lap' #alphabetical sort

# cd aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# from lifehacker
# install a package and automatically respond yes to confirmation prompt
alias ins="sudo aptitude install"
alias update="sudo aptitude update"
alias upgrade="sudo aptitude safe-upgrade"

# remove a package and its configuration files
alias remp="sudo aptitude purge"

# search for a package
alias searchc="apt-cache search"
alias search="aptitude search"
alias show="aptitude show"

# from http://superuser.com/questions/38984/linux-equivalent-command-for-open-command-on-mac-windows
alias xopen="xdg-open"

# from web

alias c=clear
alias d='dirs -v'
alias e=$EDITOR
alias se=sudoedit
alias v='gvim --remote-tab-silent'
alias vi='vim -u ~/.vimrc_light'
alias grep='egrep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias h=history
alias j=jobs
alias po=popd
alias pu=pushd
alias suod=sudo
alias s='screen -r'
alias ss='screen -Rd'
alias tt='tmux attach -d'

