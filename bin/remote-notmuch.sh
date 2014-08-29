#!/bin/bash
printf -v ARGS "%q " "$@"
exec ssh foobacca.co.uk /home/hamish/bin/notmuchwork ${ARGS}
