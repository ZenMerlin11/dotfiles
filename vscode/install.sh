#!/bin/bash
# Install VS Code


source ../lib/utils.sh
source ../environment.sh


banner "VSCode"


if not_installed code; then
  snap install code --classic
else
  echo "VS Code already installed. Skipping..."
fi

link_files "$(pwd)" "${_HOME}/.config/Code/User"