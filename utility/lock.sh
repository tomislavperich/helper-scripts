#!/bin/bash
import -window root /tmp/screenshot.png; convert /tmp/screenshot.png -filter Gaussian -blur 0x10 /tmp/screenshotblur.png; i3lock -lffffff -i /tmp/screenshotblur.png
