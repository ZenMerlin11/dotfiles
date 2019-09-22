#!/bin/bash
# Install Chromium


source ../lib/utils.sh
source ../environment.sh


banner "Chromium"


if not_installed chromium; then
  snap install chromium
else
  echo "Chromium already installed. Skipping..."
fi
