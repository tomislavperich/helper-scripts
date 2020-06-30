#!/bin/sh
#
# Handles external monitor connectivity

# Dependencies to restart upon connecting or disconnecting
dependencies="polybar"
polybar_run_command="sh $HOME/.config/polybar/launch.sh"

# Connect monitor
connect() {
    xrandr --output HDMI-1-1 --auto --left-of eDP-1-1
}

# Disconnect monitor
disconnect() {
    xrandr --output HDMI-1-1 --off
}

# Restart dependencies which break (ex. polybar)
restart_deps() {
    for dep in $dependencies; do
        if command -v $dep > /dev/null; then
            if pgrep $dep > /dev/null; then
                echo "[-] Killing ${dep}"
                pkill -9 $dep > /dev/null
            fi

            if [ -n "${dep}_run_command" ]; then
                echo "[+] Starting ${dep}"
                eval "\$${dep}_run_command > /dev/null 2>&1 &"
            fi
        fi
    done
}

# Check arguments
case "$@" in
    "-c" | "--connect" )
        echo "Connecting"
        connect
        ;;
    "-d" | "--disconnect" )
        echo "Disconnecting"
        disconnect
        ;;
    "-r" | "--restart-deps" )
        echo "[$] Restarting dependencies"
        restart_deps
        ;;
    * )
        echo "Usage: ./monitor.sh -c | -d | -r"
        return 1
        ;;
esac

# Fix keyboard layout bug
setxkbmap us,rs -variant ,latin -option grp:alt_shift_toggle
