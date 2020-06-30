#!/bin/sh
echo "Starting OpenVPN"

# Session config
session="vpn"
path="$HOME/code/web/activecollab/vpnconfig"
vpn_timeout=60
vpn_check_interval=5
vpn_routes_treshold=20

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
tmux send-keys -t "main" "./connect.sh" C-m

# Check VPN status for $vpn_timeout seconds and notify
# start_time=$(date +%s)
# while true; do
#     echo "Checking"
#     routes_connected=$(ip route | wc -l)
#     has_connected=$([ $routes_connected -gt $vpn_routes_treshold ])

#     if [ $has_connected ]; then
#         notify-send "VPN" "Connected"
#         exit 0
#     fi

#     current_time=$(date +%s)
#     time_running=$(expr $current_time - $start_time)

#     if [ $time_running -gt $vpn_timeout ]; then
#         notify-send "VPN" "Failed to connect"
#         exit 1
#     fi

#     sleep $vpn_check_interval
# done
