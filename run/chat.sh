#!/bin/sh

gajim &
viber &
pidgin &
discord &
slack &
pgrep chromium-browser || chromium-browser --app=https://messenger.com &
