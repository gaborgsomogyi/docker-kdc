#!/bin/bash

source `dirname $0`/configure-client.sh

echo "klist before TGT obtain"
klist

kinit -kt /share/user.keytab user

echo "klist after TGT obtain"
klist

bash
