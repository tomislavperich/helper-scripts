#!/bin/sh

touchpad_id=$(xinput list | grep -oE "Synaptics.*id=.." | cut -d "=" -f2)
# Set up touchpad tap to click
xinput set-prop $touchpad_id 319 1

# No disable while typing
xinput set-prop $touchpad_id 329 0

# Start libinput-gestures
. $HOME/scripts/.env
echo $USER_PASS | sudo -S libinput-gestures
