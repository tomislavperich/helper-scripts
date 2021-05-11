#!/bin/bash

## Turn the screen on
xset dpms force on

## Unlock the computer
loginctl unlock-session

## Start the VPN
kitty ~/scripts/tmux/vpn.sh &

## Start the development environment in a new terminal
kitty ~/scripts/tmux/mobile.sh & disown

# Start chat apps
pgrep slack > /dev/null || slack > /dev/null & disown
pgrep viber > /dev/null || viber > /dev/null & disown
pgrep zoom > /dev/null || zoom > /dev/null & disown

# Set the mood
amixer sset Master 70 > /dev/null

NUM_TRIES=0
play_music () {
    if $NUM_TRIES > 5; then
        exit 1
    fi

    NUM_TRIES=$((NUM_TRIES+1))

    # Kill if running; run
    killall spotify 2>/dev/null; spotify > /dev/null & disown

    sleep 6

    if spt list -d | grep -q 'legion'; then
        spt play --name "metallica enter sandman" --device "legion" --track
        spt playback -v 70
    else
        play_music
    fi
}

play_music
