#!/bin/bash
# Install i3


source ../lib/utils.sh
source ../environment.sh


banner "i3"


install i3
install feh
link_files "$(pwd)" "${_HOME}/.config/i3"
