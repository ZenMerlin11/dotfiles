#/bin/bash
# Setup git config


source ../lib/utils.sh
source ../environment.sh


banner "Git"
install git
link_files "$(pwd)" "$_HOME"
