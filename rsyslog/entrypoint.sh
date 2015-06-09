#!/bin/bash
#set -e

if [[ $APPLICATION ]]; then
  sed -i -e "s/##APPLICATION##/${APPLICATION}/" "/etc/rsyslog.conf"
else
  echo "You must set APPLICATION environment variable"
  exit 1
fi

if [[ $SCOPE ]]; then
  sed -i -e "s/##SCOPE##/${SCOPE}/" "/etc/rsyslog.conf"
else
  echo "You must set SCOPE environment variable"
  exit 1
fi

if [[ $VERSION ]]; then
  sed -i -e "s/##VERSION##/${VERSION}/" "/etc/rsyslog.conf"
else
  echo "You must set VERSION environment variable"
  exit 1
fi

sed -i -e "s/##HOST##/$(hostname)/" "/etc/rsyslog.conf"

exec "$@"
