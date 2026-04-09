#!/usr/bin/env zsh

UPDATES_FILE="${HOME}/.daily-updates-timestamp"

local start_time="$(date --iso-8601=seconds)"

echo "Starting daily updates at ${start_time}" | tee "$UPDATES_FILE"

# package updates
echo
echo "#######################"
echo "About to do apt updates"
echo "#######################"
echo
# nala upgrade does the update automatically - reinstate if using apt
# sudo nala update
sudo nala upgrade
sudo nala autoremove

# back up
echo
echo "###########################"
echo "About to back up to vinery"
echo "###########################"
echo
syncoid zroot/home syncoidrecv@vinery:zroot/backup/sftop/home

# show what usage we have right now
echo
zfs list

# show any snaps with updates pending
echo
echo "Checking for snap updates pending"
snap refresh --list

local end_time="$(date --iso-8601=seconds)"

echo
echo "Finished daily updates at ${end_time}" | tee -a "$UPDATES_FILE"
