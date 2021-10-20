#!/bin/bash

. "$HOME/scripts/.env"
tmux kill-session -t main
echo "$USER_PASS" | sudo -S killall slack zoom openconnect
pkill -9 viber
