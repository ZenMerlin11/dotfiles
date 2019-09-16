#!/bin/bash
# Terraform Installation


source ../lib/utils.sh
source ../environment.sh


TERRAFORM_VERSION="0.12.7"
TERRAGRUNT_VERSION="0.19.21"


manual_install() {
  program="$1"
  version="$2"
  install_path="$3"

  echo "Attempting to install ${program} v${version}..."

  if is_installed "$program"; then
    echo "Existing binary detected at $(which "$program"). Aborting install..."
  else
    banner "$program"
    if [[ "$program" == "terraform" ]]; then
      install_terraform "$version" "$install_path"
    else
      install_terragrunt "$version" "$install_path"
    fi
  fi
}


install_terraform() {
  version="$1"
  install_path="$2"

  echo "Downloading Terraform v${version}..."
  wget "https://releases.hashicorp.com/terraform/${version}/terraform_${version}_linux_amd64.zip"\
    -qO terraform.zip

  echo "Installing Terraform v${version} binary to ${install_path}/terraform..."
  unzip terraform.zip && \
  mv terraform "${install_path}/terraform" && \
    chmod 755 "${install_path}/terraform" && \
    rm terraform.zip && \
    echo "Terraform installed!"
}


install_terragrunt() {
  version="$1"
  install_path="$2"

  echo "Downloading Terragrunt v${version}..."
  wget "https://github.com/gruntwork-io/terragrunt/releases/download/v${version}/terragrunt_linux_amd64" \
    -qO terragrunt

  echo "Installing Terragrunt v${version} binary to ${install_path}/terragrunt..."
  mv terragrunt "${install_path}/terragrunt" && \
    chmod 755 "${install_path}/terragrunt" && \
    echo "Terragrunt installed!"
}


manual_install terraform "$TERRAFORM_VERSION" '/usr/local/bin'
manual_install terragrunt "$TERRAGRUNT_VERSION" '/usr/local/bin'
