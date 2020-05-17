#!/bin/bash
# Terraform Installation


source ../lib/utils.sh
source ../environment.sh

# Install tfenv and tgenv
tfenv_dir="${_HOME}/.tfenv"
tgenv_dir="${_HOME}/.tgenv"
if [[ ! -d "$tfenv_dir" ]]; then
  git clone https://github.com/tfutils/tfenv.git "$tfenv_dir"
fi
if [[ ! -d "$tgenv_dir" ]]; then
  git clone https://github.com/cunymatthieu/tgenv.git "$tgenv_dir"
fi
