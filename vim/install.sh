#!/bin/bash


source ../lib/utils.sh
source ../environment.sh

banner "VIM"

# Ensure vim is installed
install vim

# Setup 
if [[ ! -d "${_HOME}/.vim/bundle/Vundle.vim" ]]; then
  if is_installed zsh; then 
    su -c "zsh setup_vundle.zsh" "$_USER"
  else
    echo "Error: zsh is not installed"
    exit 1
  fi
else
  echo "Vundle is already installed. Skipping..."
fi

link_files "$(pwd)" "$_HOME"
