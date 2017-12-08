#!/bin/bash

if [ ! -d "~/.myterm/" ]; then
  git clone https://github.com/swapbytes/myterm.git ~/.myterm/ &> /dev/null
fi

# Download first xcode CommandLineTools:
# ======================================
sudo xcode-select --install &> /dev/null

# Install packages:
# =================

which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

which -s curl
if [[ $? != 0 ]] ; then
  brew install curl
fi

which -s grc
if [[ $? != 0 ]] ; then
  brew install grc
fi

which -s nmap
if [[ $? != 0 ]] ; then
  brew install nmap
fi

which -s multitail
if [[ $? != 0 ]] ; then
  brew install multitail
fi

which -s rsync
if [[ $? != 0 ]] ; then
  brew install rsync
fi

which -s wget
if [[ $? != 0 ]] ; then
  brew install wget
fi

which -s bash-completion
if [[ $? != 0 ]] ; then
  brew install bash-completion
fi

which -s awscli
if [[ $? != 0 ]] ; then
  brew install awscli
fi

which -s sysbench
if [[ $? != 0 ]] ; then
  brew install sysbench
fi

brew cask list | grep google-chrome &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force google-chrome
fi

brew cask list | grep iterm2 &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force iterm2
fi

brew cask list | grep spectacle &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force spectacle
fi

brew cask list | grep transmission &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force transmission
fi

brew cask list | grep virtualbox &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force virtualbox
fi

brew cask list | grep spotify &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force spotify
fi

brew cask list | grep vagrant &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force vagrant
fi

if [ ! -f ~/.git-completion.bash ]; then
  wget -O ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi

# Remove old link´s:
# ==================
if [ -f ~/.bash_profile ]; then
  unlink ~/.bash_profile
fi

if [ -f ~/.inputrc ]; then
  unlink ~/.inputrc
fi

if [ -f ~/.aliases ]; then
  unlink ~/.aliases
fi

if [ -f ~/.functions ]; then
  unlink ~/.functions
fi

if [ -f ~/.vimrc ]; then
  unlink ~/.vimrc
fi

if [ -f ~/.gitignore_global ]; then
  unlink ~/.gitignore_global
fi

if [ -f ~/.ssh/config ]; then
  unlink ~/.ssh/config
fi

if [ -f ~/.editrc ]; then
  unlink ~/.editrc
fi

if [ -f ~/.grcat ]; then
  unlink ~/.grcat
fi

if [ -f ~/.my.cnf ]; then
  unlink ~/.my.cnf
fi

mkdir -p ~/.ssh/

# Create link´s:
# ===============
ln -s ~/.myterm/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.myterm/dotfiles/inputrc ~/.inputrc
ln -s ~/.myterm/dotfiles/aliases ~/.aliases
ln -s ~/.myterm/dotfiles/functions ~/.functions
ln -s ~/.myterm/dotfiles/editrc ~/.editrc
ln -s ~/.myterm/dotfiles/vimrc ~/.vimrc
ln -s ~/.myterm/dotfiles/grcat ~/.grcat
ln -s ~/.myterm/dotfiles/my.cnf ~/.my.cnf
ln -s ~/.myterm/dotfiles/ssh_config ~/.ssh/config
ln -s ~/.myterm/dotfiles/gitignore_global ~/.gitignore_global
ln -s ~/.myterm/dotfiles/tmux.conf ~/.tmux.conf

# Run several config commands:
# ============================
~/.myterm/scripts/git.sh
~/.myterm/scripts/osx.sh

# Reload profile:
# ===============
source ~/.bash_profile
