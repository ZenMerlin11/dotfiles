#!/bin/bash
# Install zsh and oh-my-zsh


source ../lib/utils.sh
source ../environment.sh

install_changed="false"


banner "Zsh"


# Ensure Zsh is installed
if not_installed zsh; then
  install zsh
  sudo chsh -s /usr/bin/zsh "$_USER"
  install_changed="true"
else
  echo "Zsh already installed. skipping..."
fi


# Ensure oh-my-zsh is installed
if [[ ! -d "${_HOME}/.oh-my-zsh" ]]; then
  uri='https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh'
  su -c sh -c "wget -qO- ${uri}" "$_USER"
  install_changed="true"
else
  echo "oh-my-zsh already installed. skipping..."
fi


# Re-link dotfiles if install has changed
if [[ "$install_changed" == "true" ]]; then
  link_files "$(pwd)" "$_HOME"
fi
