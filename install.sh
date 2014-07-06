#!/bin/bash

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

if [ -f ~/.vim ]; then
  unlink ~/.vim
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

# Create link´s.
# ===============
ln -s ~/.myterm/bash/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.myterm/bash/dotfiles/inputrc ~/.inputrc
ln -s ~/.myterm/bash/dotfiles/aliases ~/.aliases
ln -s ~/.myterm/bash/dotfiles/functions ~/.functions
ln -s ~/.myterm/bash/dotfiles/editrc ~/.editrc
ln -s ~/.myterm/bash/dotfiles/vim/ ~/.vim
ln -s ~/.myterm/bash/dotfiles/vimrc ~/.vimrc
ln -s ~/.myterm/bash/dotfiles/ssh_config ~/.ssh/config
ln -s ~/.myterm/bash/dotfiles/gitignore_global ~/.gitignore_global
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /bin/subl

# Run several config commands.
# ============================
~/.myterm/configs/git.sh
~/.myterm/configs/osx.sh
~/.myterm/configs/st.sh

# Install packages.
# =================

which -s brew
if [[ $? != 0 ]] ; then
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
  brew tap phinze/cask
  brew tap caskroom/homebrew-versions
  brew install brew-cask
fi

which -s subl
if [[ $? != 0 ]] ; then
  brew cask install sublime-text-3
fi

which -s curl
if [[ $? != 0 ]] ; then
  brew install curl
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

brew cask list | grep evernote &> /dev/null
if [ $? == 1 ] ; then
  brew cask install --force evernote
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

# Reload profile.
# ===============
source ~/.bash_profile
