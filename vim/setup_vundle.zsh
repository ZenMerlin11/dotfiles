#!/bin/zsh


source ../environment.sh

if [[ -h "${_HOME}/.zshrc" ]]; then
  source "${_HOME}/.zshrc"
  vundle-init
  if [[ "$?" != "0" ]]; then
    echo "Error: vundle-init plugin failed"
    exit 1
  fi
  vundle
  if [[ "$?" != "0" ]]; then
    echo "Error: vundle plugin failed"
    exit 1
  fi
else
  echo "Error: .zshrc symlink not found"
  exit 1
fi
