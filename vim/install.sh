#!/bin/bash


source ../lib/utils.sh
source ../environment.sh


banner "VIM"


# Ensure vim is installed
if not_installed vim; then
  install vim
  link_files "$(pwd)" "$_HOME"
fi


# Setup 
if [[ ! -d "${_HOME}/.vim/bundle/Vundle.vim" ]]; then
  if is_installed zsh; then 
    su -c "zsh setup_vundle.zsh" "$_USER" && \
      echo "Installing vim plugins..." && \
      vim -E -s -c "source ~/.vimrc" -c "PluginInstall" -c "qa"
  else
    echo "Error: zsh is not installed"
    exit 1
  fi
else
  echo "Vundle is already installed. Skipping..."
fi
