#!/bin/bash
# Docker CE Installation Reference: 
# https://docs.docker.com/install/linux/docker-ce/ubuntu/#install-docker-ce

source ../lib/utils.sh
source ../environment.sh

banner "Docker"

if not_installed docker; then
  # Ensure dependency installed

  # Set up Docker repository
  echo "Installing packages to allow apt to use a repository over HTTPS..."
  install apt-transport-https
  install ca-certificates
  install gnupg-agent
  install software-properties-common

  echo "Adding Docker's official GPG key..."
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | \
    sudo apt-key add -

  echo "Adding repository for Docker stable release..."
  sudo add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"

  # Install Docker CE
  update_apt_package_index

  echo "Installing latest version of Docker CE, Docker CLI, and Containerd.io..."
  install docker-ce
  install docker-ce-cli
  install containerd.io

  # Install docker-compose
  sudo curl -fsSL \
    "https://github.com/docker/compose/releases/download/1.24.1/docker-compose-$(uname -s)-$(uname -m)" \
    -o /usr/local/bin/docker-compose

  # Create docker group and add vagrant user to avoid permissions issues
  sudo groupadd docker
  sudo usermod -aG docker vagrant

  # To install a specific version by its fully qualified package name, use:
  # sudo apt-get install docker-ce=<VERSION>

else
  echo "Docker already installed. Skipping..."
fi
