# Zenmerlin's Dotfiles
## Overview
These are my dotfiles I use for setting up development vm's across my machines
and are provided here for inspiration or your own use. This is setup and tested
for use with Ubuntu 19.04. If using another OS/Distro you may have some more
work to do. Start with looking at the package manager install functions in
`lib/utils.sh`. Feel free to clone/fork and use as you please, but use at your
own risk. If you do somehow manage to destroy your computer, do something quite
illegal, instigate global thermonuclear war, etc, it's not my fault so don't sue
and/or incarcerate me. ;)

## Tools Summary
1. Zsh
2. Python 3.7, Pip, Virtualenv
3. i3 Config and Keyboard Setup (Using CapsLock for mod key to avoid fighting
   with Windows key)
4. Vim 8, Vundle, Various Plugins/Color Schemes
5. VS Code and Extensions
6. Node Version Manager
7. Golang
8. Git
9. Docker
10. AWS-CLI
11. Terraform and Terragrunt
12. Chromium

## Getting Started
1. Clone the repo to your home directory: `~./.dotfiles`
2. Edit `~/.dotfiles/environment.sh` to change `_USER` to your user name.
   (Required for some tools to be setup with your user)
3. From your dotfiles directory, run `sudo ./bootstrap.sh`.
4. You will be prompted for your name and email to setup your .gitconfig if you
   haven't set them already. (I recommend after initial setup you don't check
   this file in if you don't want your name and email in the repo for any
   reason)

## Organization
Heavily inspired by
[holman/dotfiles](http://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/),
my install and config files are separated into subdirectories based on which
tool they belong to. Each subdirectory will contain (as applicable) an
`install.sh` script, `...rc.zsh` rc file, and dotfiles to be linked elsewhere.
Common utilities for working with these, such as package manager and symlink
functions, are found in `./lib/utils.sh`.

### 1. Install Scripts

The `install.sh` scripts are found and executed automatically by `bootstrap.sh`.
Order of intall of these scripts is not guaranteed, so in cases where something
is needed as a dependency for another tool, those are provided with an
`_install.sh` script and explicitly installed in `bootstrap.sh`. For example,
Zsh and Python in this repo are installed first since other packages are
dependent on them. 

### 2. Config (dot) Files

Config files or dotfiles that would normally appear in your home directory are
added with the extension `.symlink` in each subdirectory. For example, your
`.zshrc` file is located in the `zsh` subdirectory with the filename
`.zshrc.symlink`. The `install.sh` or `_install.sh` script in the subdirectory
will need to include steps to link these files to the appropriate location,
since where and how the configuration files should be linked may vary from
package to package.

### 3. rc Files

The `.zshrc` file will scan all of the subdirectories in the dotfiles repo and
source any files ending with pattern `rc.zsh`. This allows your Zsh config for
specific utilities to live with the utility they belong to, and makes adding or
removing utilities easier. If, for example you removed `nvm` from dotfiles, you
would simply delete that subdirectory and all install scripts, dotfiles, and
`.zshrc` config would be removed.

**Note:** While removing the tool's subdirectory would remove the configuration
files and install scripts to prevent the tool from being provisioned on
subsequent runs of `bootstrap.sh`, this won't actually uninstall any pacakges
associated with that tool. This would have to be done manually after the fact.
My approach to this is since I'm using this to provision vm's primarily, I will
maintain a base build snapshot of the machine prior to provisioning. If I need
to change the setup, I make the changes to my repo, revert to my base snapshot,
and re-run `bootstrap.sh`. I prefer to think of my vm/dev environment as
*immutable* to a certain degree. Instead of changing it, I set it up once and if
I need to change it again I throw that one away and rebuild. I'm not a purist on
this, but that's my general philosophy. In the end, it comes down to what is
easiest to do. Use your own judgment.
