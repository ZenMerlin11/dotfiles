#!/bin/bash
# Script to install NVM for zsh


source ../lib/utils.sh
source ../environment.sh

NVM_VERSION="v0.34.0"

banner "NVM"

if [[ ! -d "${_HOME}/.nvm" ]]; then
  ensure_cd "$_HOME"
  su -c "git clone https://github.com/nvm-sh/nvm.git .nvm" "$_USER"
  ensure_cd "${_HOME}/.nvm"
  su -c "git checkout ${NVM_VERSION}"
  ensure_cd "$DOTFILES_ROOT"
else
  echo "NVM already installed. Skipping..."
fi
