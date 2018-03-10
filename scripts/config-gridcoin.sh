#!/bin/bash
cp /scripts/gridcoin.conf /data/gridcoinresearchd.conf

if [ "${GRC_RPC_PASSWORD}" == "changeme" ]; then
  GRC_RPC_PASSWORD=$(pwgen 32 1)
fi

sed "s/__BOINC_EMAIL__/${BOINC_EMAIL}/g" -i /data/gridcoinresearchd.conf
sed "s/__RPC_USER__/${GRC_RPC_USERNAME}/g" -i /data/gridcoinresearchd.conf
sed "s/__RPC_PASSWORD__/${GRC_RPC_PASSWORD}/g" -i /data/gridcoinresearchd.conf
