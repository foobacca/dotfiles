#!/bin/bash
printf -v ARGS "%q " "$@"
exec ssh foobacca.co.uk /home/hamish/.linuxbrew/bin/notmuch --config=/home/hamish/.notmuch-config-work ${ARGS}
