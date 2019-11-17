#!/bin/sh

# Smaller keypress delay and faster repeat
xset r rate 220 30

### Layout
# Set layout to en,rs(latin),rs(cyrillic), use alt+shift to cycle
setxkbmap us,rs,rs -variant ,latin, -option grp:alt_shift_toggle

### Rebind
# Caps lock to ctrl
setxkbmap -option caps:ctrl_modifier

# Rebind Menu to Super_L
xmodmap -e "keycode 135 = Super_L"

# Rebind unknown key to 0
xmodmap -e keycode 93 = 0
