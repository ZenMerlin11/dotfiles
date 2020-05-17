#!/bin/bash
# Bootstrap script for Ubuntu 19.04 Development Environment

source lib/utils.sh
source environment.sh


# Ensure working directory in dotfiles root
ensure_cd "$DOTFILES_ROOT"

# Set git config name and email
if grep -Fq '<git_name>' ./git/.gitconfig.symlink; then
  echo "Enter name for .gitconfig: "
  read -r git_name
  sed -i "s/<git_name>/${git_name}/g" ./git/.gitconfig.symlink
fi

if grep -Fq '<git_email>' ./git/.gitconfig.symlink; then
  echo "Enter email for .gitconfig: "
  read -r git_email
  sed -i "s/<git_email>/${git_email}/g" ./git/.gitconfig.symlink
fi

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
install shellcheck
install tmux
install htop
install neofetch
install caffeine

# Ensure these dependencies installed first
ensure_cd "${DOTFILES_ROOT}/zsh"
bash _install.sh
ensure_cd "${DOTFILES_ROOT}/python"
bash _install.sh
ensure_cd "$DOTFILES_ROOT"

# Install tools
files="$(find -H . -maxdepth 2 -name 'install.sh' -not -path "./.git/*")"
for file in $files; do
  ensure_cd "$(dirname "$file")"
  bash "$(basename "$file")"
  ensure_cd "$DOTFILES_ROOT"
done

banner "Setup Complete" -f slant
