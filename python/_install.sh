#!/bin/bash
# Install python37, pip, venv


source ../lib/utils.sh
source ../environment.sh

banner "Python"

install python3-pip
install build-essential
install libssl-dev
install libffi-dev
install python3-dev
install python3-venv
