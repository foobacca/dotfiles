#!/bin/bash

save_active () {
    # get current workspace
    ActiveDesktop="$(xdotool get_desktop)"
    # get current active window ID
    ActiveWindowID="$(xdotool getactivewindow)"
    # get current active window name
    ActiveWindowName="$(xdotool getwindowname "$ActiveWindowID")"
}

restore_active(){
    xdotool set_desktop "$ActiveDesktop"
    # Activating the root window (Desktop) results in an error message, so we
    # try to avoid it
    [[ "$ActiveWindowName" != "Desktop" ]] && xdotool windowactivate "$ActiveWindowID"
}

toggle_mute_hangout(){
    # select the Firefox window
    wmctrl -a Firefox
    sleep 0.1
    # :b hangouts<return> selects the hangouts tab (using vimperator)
    # Ctrl+d toggles mute in hangouts
    xdotool getactivewindow key : b ' ' h a n g o u t s "Return" "ctrl+d"
}

play_pause_youtube(){
    # select the Firefox window
    wmctrl -a Firefox
    sleep 0.1
    # :b hangouts<return> selects the hangouts tab (using vimperator)
    # Ctrl+d toggles mute in hangouts
    xdotool getactivewindow key b " " y o u t u b e "Tab" "Return" k
}

unknown_arg(){
    echo "unknown argument $1"
    exit 2
}

arg="$1"

if [ $arg = 'toggle_mute_hangout' ]; then
    save_active
    toggle_mute_hangout
    restore_active
elif [ $arg = 'play_pause_youtube' ]; then
    save_active
    play_pause_youtube
    restore_active
else
    unknown_arg
fi
