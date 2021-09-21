#!/bin/sh

# Session config
session="main"
path="$HOME/code/stackpath"

# Check if tmux session already exists
session_exists=$(tmux ls 2>&1 | grep $session)
if [ "$session_exists" != "" ]; then
    tmux a -t $session
    exit 0
fi

# Create session
tmux new -d -s $session -c $path

# Rename window and start vpn
tmux rename-window -t 1 "main"

# Start npm
tmux send-keys -t "main" "~/scripts/utility/vpn_login.sh" C-m

# Start android
tmux new-window -t "main:2"
sleep 2

tmux -2 attach-session -t $session
