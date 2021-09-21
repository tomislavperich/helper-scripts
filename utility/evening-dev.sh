#!/bin/bash

. "$HOME/scripts/.env"
tmux kill-session -t vpn
tmux kill-session -t main
echo "$USER_PASS" | sudo -S killall slack zoom openvpn
pkill -9 viber
