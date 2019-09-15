#!/bin/bash
# Install zsh and oh-my-zsh


source ../lib/utils.sh
source ../environment.sh
pwd


if not_installed zsh; then
  banner "Zsh"
  install zsh
  sudo chsh -s /usr/bin/zsh "$_USER"
else
  echo "zsh already installed. skipping..."
fi


if [[ ! -d "${_HOME}/.oh-my-zsh" ]]; then
  uri='https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
  su -c sh -c "wget -qO- ${uri}" "$_USER"
else
  echo "oh-my-zsh already installed. skipping..."
fi
