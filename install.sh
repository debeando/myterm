#!/bin/bash

# Download first xcode CommandLineTools dropbox, signin and sync all, before run this script.

sudo xcode-select --install
xcode-select --print-path

# Install packages.
# =================

which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew tap phinze/cask
  brew tap caskroom/homebrew-versions
  brew install brew-cask
fi

which -s rbenv
if [[ $? != 0 ]] ; then
  brew install rbenv ruby-build
  rbenv install 2.1.2
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

which -s html2text
if [[ $? != 0 ]] ; then
  brew install html2text
fi

which -s js
if [[ $? != 0 ]] ; then
  brew install spidermonkey
fi

which -s mpg123
if [[ $? != 0 ]] ; then
  brew install mpg123
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

which -s s3cmd
if [[ $? != 0 ]] ; then
  brew install s3cmd
fi

which -s awscli
if [[ $? != 0 ]] ; then
  brew install awscli
fi

which -s percona-toolkit
if [[ $? != 0 ]] ; then
  brew install percona-toolkit
fi

which -s sysbench
if [[ $? != 0 ]] ; then
  brew install sysbench
fi

brew cask list | grep atom &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force atom
fi

brew cask list | grep adium &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force adium
fi

brew cask list | grep alfred &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force alfred
fi

brew cask list | grep dropbox &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force dropbox
fi

brew cask list | grep google-chrome &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force google-chrome
fi

brew cask list | grep hipchat &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force hipchat
fi

brew cask list | grep iterm2 &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force iterm2
fi

brew cask list | grep spectacle &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force spectacle
fi

brew cask list | grep the-unarchiver &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force the-unarchiver
fi

brew cask list | grep tunnelblick &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force tunnelblick
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

brew cask list | grep menumeters &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force menumeters
fi

brew cask list | grep transmission &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force transmission
fi

if [ ! -f ~/.git-completion.bash ]; then
  wget -O ~/.git-completion.bash https://raw.github.com/git/git/master/contrib/completion/git-completion.bash
fi

# Remove old link´s.
# ===============
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

# Install gem's.
# ==============
if [ ! gem list termit -i ]; then
  gem install termit
fi

if [ ! gem lis ghost -i ]; then
  gem install ghost
  sudo gem install ghost
fi

# Create link´s.
# ===============
ln -s ~/.myterm/bash/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.myterm/bash/dotfiles/inputrc ~/.inputrc
ln -s ~/.myterm/bash/dotfiles/aliases ~/.aliases
ln -s ~/.myterm/bash/dotfiles/functions ~/.functions
ln -s ~/.myterm/bash/dotfiles/editrc ~/.editrc
ln -s ~/.myterm/bash/dotfiles/vimrc ~/.vimrc
ln -s ~/.myterm/bash/dotfiles/grcat ~/.grcat
ln -s ~/.myterm/bash/dotfiles/my.cnf ~/.my.cnf
ln -s ~/.myterm/bash/dotfiles/ssh_config ~/.ssh/config
ln -s ~/.myterm/bash/dotfiles/gitignore_global ~/.gitignore_global

# Run several config commands.
# ============================
~/.myterm/configs/git.sh
~/.myterm/configs/osx.sh
~/.myterm/configs/atom.sh

# Reload profile.
# ===============
source ~/.bash_profile
