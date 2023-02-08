#!/bin/bash

# Turn the screen on
xset dpms force on

# Unlock the computer
loginctl unlock-session

# Start the development environment in a new terminal
kitty --hold ~/scripts/tmux/work.sh & disown

# Start chat apps
pgrep slack > /dev/null || slack > /dev/null & disown
pgrep viber > /dev/null || viber > /dev/null & disown
pgrep zoom > /dev/null || zoom > /dev/null & disown

# Set the mood
amixer sset Master 70 > /dev/null

NUM_TRIES=0
play_music () {
    if [ $NUM_TRIES -gt 5 ]; then
        exit 1
    fi

    NUM_TRIES=$((NUM_TRIES+1))

    # Kill if running; run
    killall spotify 2>/dev/null; spotify > /dev/null & disown

    sleep 6

    if spt list -d | grep -q 'legion'; then
        spt playback -v 30
        spt play --name "enter sandman" --device "legion" --track
        exit 0
    else
        exit 1
        play_music
    fi
}

# play_music
