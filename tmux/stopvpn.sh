#!/usr/bin/sh
. $HOME/scripts/.env
echo $USER_PASS | sudo -S killall openvpn 2> /dev/null && tmux kill-session -t 'vpn'
