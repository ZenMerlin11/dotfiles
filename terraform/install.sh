#!/bin/bash
# Terraform Installation


source ../lib/utils.sh
source ../environment.sh

banner "Terraform"

# Install tfenv and tgenv
tfenv_dir="${_HOME}/.tfenv"
tgenv_dir="${_HOME}/.tgenv"
if [[ ! -d "$tfenv_dir" ]]; then
  su -c "git clone https://github.com/tfutils/tfenv.git ${tfenv_dir}" "$_USER"
fi
if [[ ! -d "$tgenv_dir" ]]; then
  su -c "git clone https://github.com/cunymatthieu/tgenv.git ${tgenv_dir}" "$_USER"
fi
