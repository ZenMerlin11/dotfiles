#!/bin/bash
# Terraform Installation

source ../lib/utils.sh
source ../environment.sh

banner "Misc. Packages"

packages=(
  zip
  nmap
  cowsay
  lolcat
  jq
  jo
  dialog
  ranger
  curl
  wget
  tree
  shellcheck
  tmux
  htop
  neofetch
  caffeine
  valgrind
  hugo
  terminator
  proxychains
  tor
  net-tools
  tshark
  xclip
)

for package in "${packages[@]}"; do
  install "$package"
done
