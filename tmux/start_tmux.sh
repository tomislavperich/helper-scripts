#!/bin/bash
SESSION=$USER

tmux -2 new-session -d -s "$SESSION"

# Setup a window for home dir
tmux rename-window "home"
tmux split-window -h

# Setup a download window
tmux new-window -t "$SESSION":1 -n "nvim" 

# Set default window
tmux select-window -t "$SESSION":0
tmux select-pane -t "$SESSION:home.0"

# Send keys
sleep 0.3
tmux send-keys -t "$SESSION:home.0" C-l
tmux send-keys -t "$SESSION:home.1" C-l
tmux send-keys -t "$SESSION:nvim" "nvim" Enter C-l
tmux send-keys -t "$SESSION:nvim" C-n

# Attach to session
tmux -2 attach-session -t "$SESSION"
