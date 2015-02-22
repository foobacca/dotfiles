#!/bin/bash
printf -v ARGS "%q " "$@"
exec ssh foobacca.co.uk /usr/bin/notmuch --config=/home/hamish/.notmuch-config-work ${ARGS}
