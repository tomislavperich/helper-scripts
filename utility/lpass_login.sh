#!/bin/bash
source ~/scripts/.env
echo $LASTPASS_PASS | LPASS_DISABLE_PINENTRY=1 lpass login $LASTPASS_EMAIL
