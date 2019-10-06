#!/bin/bash
# Bootstrap script for Ubuntu 19.04 Development Environment

source lib/utils.sh
source environment.sh


# Ensure working directory in dotfiles root
cd "$DOTFILES_ROOT"


# Update package index and apply available package upgrades
upgrade_packages


# Ensure figlet installed for printing banners
install figlet


# Banner
banner "Zen Box" -f slant


# Install misc utilities
install zip
install nmap
install cowsay
install lolcat
install jq
install jo
install dialog
install ranger
install curl
install wget
install tree


# Set git config name and email
echo "Setup .gitconfig"
echo "Enter name: "
read git_name
echo "Enter email: "
read git_email
sed -i "s/<git_name>/${git_name}/g" git/.gitconfig.symlink
sed -i "s/<git_email>/${git_email}/g" git/.gitconfig.symlink


# Ensure these dependencies installed first
cd "${DOTFILES_ROOT}/zsh" && bash _install.sh
cd "${DOTFILES_ROOT}/python" && bash _install.sh
cd "$DOTFILES_ROOT"


# Install tools
files="$(find -H . -maxdepth 2 -name 'install.sh' -not -path "./.git/*")"
for file in $files; do
  cd $(dirname "$file") && bash $(basename "$file")
  cd "$DOTFILES_ROOT"
done

banner "Setup Complete" -f slant
