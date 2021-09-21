#!/bin/bash
workdir=$(dirname $0)
$workdir/lpass_login.sh
source $workdir/../.env

# Almost works, need to figure out how to pass sudo pass when executing opeconnect
echo -e "$(lpass show --password "$VPN_PASS_LPASS_ID")\npush" | sudo /usr/sbin/openconnect --passwd-on-stdin -u "$VPN_USER" "$VPN_DOMAIN"
