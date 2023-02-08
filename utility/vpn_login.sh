#!/bin/bash

# Load secrets into env
workdir=$(dirname $0)
source $workdir/../.env

# Almost works, need to figure out how to pass sudo pass when executing opeconnect
echo "$USER_PASS" | sudo -S echo "" > /dev/null
echo -e "$(bw get password 88064481-1ea3-48c9-b94f-aef3007d834e)\npush" | sudo -S /usr/sbin/openconnect --passwd-on-stdin -u "$VPN_USER" "$VPN_DOMAIN"
