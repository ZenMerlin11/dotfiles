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

# Install VS Code extensions
su -c \
  "< extensions.txt xargs -L1 /snap/bin/code --install-extension" \
  "$_USER"

mkdir -p "${_HOME}/.config/Code/User"
link_files "$(pwd)" "${_HOME}/.config/Code/User"
