#!/bin/sh

# Session config
session="mobile"
path="$HOME/code/mobile/activecollab-mobile"

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
tmux send-keys -t "main" "npm run start" C-m

# Start android
tmux split-window -h -c $path
tmux select-pane -t "$session:main.2"
tmux send-keys 'emulator -noaudio -avd $(emulator -list-avds) > /dev/null & disown' C-m
sleep 3
tmux send-keys 'npm run android' C-m

tmux -2 attach-session -t $session
