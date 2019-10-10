#!/usr/bin/sh
export DISPLAY=:0
echo $1 | sudo -S brightnessctl s 200+
