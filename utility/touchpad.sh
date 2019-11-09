#!/bin/sh

# Set up touchpad tap to click
xinput set-prop 13 319 1

# Start libinput-gestures
. $HOME/scripts/.env
echo $USER_PASS | sudo -S libinput-gestures
