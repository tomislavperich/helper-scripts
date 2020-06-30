#!/usr/bin/sh
. $HOME/scripts/.env
echo $USER_PASS | sudo -S brightnessctl s 10%+
# # sleep 0.05
# echo $USER_PASS | sudo -S brightnessctl s 1%+
# # sleep 0.05
# echo $USER_PASS | sudo -S brightnessctl s 1%+
