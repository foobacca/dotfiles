#!/usr/bin/env zsh

# could include it, but I reckon I'm more likely to run the daily anyway
# and then think "oh yeah, the weekly updates too"
# "${HOME}/bin/daily-updates.sh"

UPDATES_FILE="${HOME}/.weekly-updates-timestamp"

local start_time="$(date --iso-8601=seconds)"

echo "Starting weekly updates at ${start_time}" | tee "$UPDATES_FILE"

# home brew packages
echo
echo "#############################"
echo "About to update brew packages"
echo "#############################"
echo
brew update && brew upgrade
brew cleanup

# uv tool upgrades
echo
echo "########################"
echo "About to update uv tools"
echo "########################"
echo
uv tool upgrade --all

# oh-my-zsh update
echo
echo "#########################"
echo "About to update oh-my-zsh"
echo "#########################"
echo
"${HOME}/.oh-my-zsh/tools/upgrade.sh"

# update firmware
echo
echo "###################################"
echo "About to check for firmware updates"
echo "###################################"
echo
fwupdmgr refresh
fwupdmgr get-updates

# zoom upgrade
echo
echo "#########################"
echo "About to update zoom"
echo "#########################"
echo
ZOOM_DEB_PATH=/tmp/zoom_latest_amd64.deb
rm -f "${ZOOM_DEB_PATH}"
curl -L -o "${ZOOM_DEB_PATH}" https://zoom.us/client/latest/zoom_amd64.deb
sudo apt -y install "${ZOOM_DEB_PATH}"
rm -f "${ZOOM_DEB_PATH}"

echo
echo "#########################"
echo "Checking disk usage"
echo "#########################"
echo
dust --limit-filesystem "${HOME}"

local end_time="$(date --iso-8601=seconds)"

echo
echo "Finished weekly updates at ${end_time}" | tee -a "$UPDATES_FILE"
