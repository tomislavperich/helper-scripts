#!/bin/bash

## Turn the screen on
xset dpms force on

## Unlock the computer
loginctl unlock-session

## Start the VPN
kitty ~/scripts/tmux/vpn.sh &

## Start the development environment in a new terminal
kitty ~/scripts/tmux/mobile.sh & disown

# Set the mood
amixer sset Master 70 > /dev/null
play_music () {
    # Kill if running; run
    killall spotify 2>/dev/null; spotify > /dev/null & disown

    sleep 5

    if spt list -d | grep -q 'legion'; then
        spt play --name "metallica enter sandman" --track
        spt playback -v 70
    else
        play_music
    fi
}

play_music
