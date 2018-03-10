#!/bin/bash

# Prepare boinc
if [ ! -d /data/boinc ]; then
  echo "Initializing boinc config ..."
  cp -R /var/lib/boinc-client /data/boinc
fi

if [ ! -f /data/gridcoinresearchd.conf ]; then
  echo "No config found, generating ..."
  /scripts/config-gridcoin.sh
fi

# Run supervisor

supervisord -nc /etc/supervisor/supervisord.conf
