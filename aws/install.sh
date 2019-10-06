#!/bin/bash
# Go Installation


source ../lib/utils.sh
source ../environment.sh

banner "AWS-CLI"

if [[ ! -e "${HOME}/.local/bin/aws" ]]; then
  su -c "pip3 install awscli --upgrade --user" "$_USER"
else
  echo "AWS-CLI appears to already be installed. Skipping..."
fi
