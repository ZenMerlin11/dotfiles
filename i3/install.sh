#!/bin/bash
# Install i3


source ../lib/utils.sh
source ../environment.sh


banner "i3"


install i3
install feh
mkdir -p "${_HOME}/.config/i3"
link_file "$(pwd)/config.symlink" "${_HOME}/.config/i3/config"
link_file "$(pwd)/.Xmodmap.symlink" "${_HOME}/.Xmodmap"
