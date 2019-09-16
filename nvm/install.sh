#!/bin/bash
# Script to install NVM for zsh


source ../lib/utils.sh
source ../environment.sh


NVM_VERSION="v0.34.0"

if [[ ! -d "${_HOME}/.nvm" ]]; then
  banner "NVM"
  cd "$_HOME"
  su -c "git clone https://github.com/nvm-sh/nvm.git .nvm" "$_USER"
  cd "${_HOME}/.nvm"
  su -c "git checkout ${NVM_VERSION}"
  cd "$DOTFILES_ROOT"
else
  echo "NVM already installed. Skipping..."
fi

