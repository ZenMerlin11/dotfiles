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
  ranger
  curl
  wget
  tree
  shellcheck
  htop
  neofetch
)

for package in "${packages[@]}"; do
  install "$package"
done
