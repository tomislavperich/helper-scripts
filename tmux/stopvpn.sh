#!/usr/bin/sh
. $HOME/scripts/.env
echo $USER_PASS | sudo -S killall openvpn && tmux kill-session -t 'vpn'
