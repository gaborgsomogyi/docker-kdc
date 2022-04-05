#!/bin/bash

current_dir=$(pwd)

. $current_dir/network.sh

NETWORK=delegation-token-network
create_network_if_not_exists ${NETWORK}
docker run -it --env-file=kerberos.env --hostname=kdc --name=kdc --network ${NETWORK} --rm --mount type=bind,source=${HOME}/share,target=/share -p 88:88 -p 749:749 gaborgsomogyi/kdc:latest
