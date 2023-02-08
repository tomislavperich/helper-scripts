#!/bin/bash

# From the wpctl command output, find a device which does
# not start with '*' (not selected), take first, extract ID
# and use wpctl to set is as the active device
alternate_output_id=$(wpctl status | grep -A3 "Sinks:" | grep -v '*' | grep -oP "\d{1,3}\.\s.*" | grep -oP '\d+\. ' | sed 's/\.\s//' | head -n1)
wpctl set-default $alternate_output_id