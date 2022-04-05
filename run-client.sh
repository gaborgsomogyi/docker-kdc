#!/bin/bash

current_dir=$(pwd)

. $current_dir/network.sh

NETWORK=delegation-token-network
create_network_if_not_exists ${NETWORK}
docker run -it --env-file=kerberos.env --hostname=kdc-client --name=kdc-client --network ${NETWORK} --rm --mount type=bind,source=${HOME}/share,target=/share gaborgsomogyi/kdc-client:latest
