#!/bin/bash
# Go Installation


source ../lib/utils.sh
source ../environment.sh

GO_VERSION="1.14.3"

banner "Go"

if [[ -e "/usr/local/go/bin/go" ]]; then
  echo "Go already installed. Skipping..."
else
  echo "Downloading Go v${GO_VERSION}"
  wget "https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz" \
    -qO "go${GO_VERSION}.linux-amd64.tar.gz"
  echo "Installing Go v${GO_VERSION}"
  tar -C /usr/local -xzf "go${GO_VERSION}.linux-amd64.tar.gz" && \
    rm "go${GO_VERSION}.linux-amd64.tar.gz"
  su -c "mkdir -p ${_HOME}/go/src" "$_USER"
fi
