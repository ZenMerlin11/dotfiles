#!/bin/bash
# Uninstall go


source ../lib/utils.sh
source ../environment.sh

if [ "$EUID" -ne 0 ]
  then echo "Please run as root"
  exit 1
fi

if [[ -d "/usr/local/go" ]]; then
  echo "Uninstalling go..."
  rm -rf "/usr/local/go"
else
  echo "Go installation not found. Aborting..."
fi
