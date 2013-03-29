#!/bin/sh
if test -f $HOME/.gpg-agent-info &&    kill -0 ‘cut -d: -f 2 $HOME/.gpg-agent-info‘ 2>/dev/null; then
     eval $(cat $HOME/.gpg-agent-info)
     export GPG_AGENT_INFO
     #export SSH_AUTH_SOCK
     #export SSH_AGENT_PID
else
     #eval 'gpg-agent --daemon --enable-ssh-support --write-env-file'
     eval 'gpg-agent --daemon --write-env-file'
fi
