#!/bin/bash
# Install python37, pip, venv


source ../lib/utils.sh
source ../environment.sh

banner "Python"

packages=(
  python3-pip
  build-essential
  libssl-dev
  libffi-dev
  python3-dev
  python3-venv
)

for package in "${packages[@]}"; do
  install "$package"
done
