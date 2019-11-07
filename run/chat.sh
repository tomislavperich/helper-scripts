#!/bin/sh

gajim &
viber &
pidgin &
discord &
pgrep chromium-browser || chromium-browser --app=https://messenger.com &
