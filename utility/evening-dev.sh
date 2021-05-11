#!/bin/bash

. $HOME/scripts/.env
tmux kill-session -t vpn
tmux kill-session -t mobile
echo $USER_PASS | sudo -S killall slack zoom openvpn spotify
pkill -9 viber
