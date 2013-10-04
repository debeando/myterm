#!/bin/bash

# Remove old link´s.
# ===============
if [ -f ~/.bash_profile ]; then
  unlink ~/.bash_profile
fi

if [ -f ~/.inputrc ]; then
  unlink ~/.inputrc
fi

if [ -f ~/.vimrc ]; then
  unlink ~/.vimrc
fi

if [ -f ~/.gitignore_global ]; then
  unlink ~/.gitignore_global
fi

# Create link´s.
# ===============
ln -s ~/.myterm/bash/dotfiles/bash_profile ~/.bash_profile
ln -s ~/.myterm/bash/dotfiles/inputrc ~/.inputrc
ln -s ~/.myterm/bash/dotfiles/vimrc ~/.vimrc
ln -s ~/.myterm/bash/dotfiles/gitignore_global ~/.gitignore_global
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /bin/subl


# Run several config commands.
# ============================
~/.myterm/configs/git.sh
~/.myterm/configs/osx.sh

# Install packages.
# =================

which -s curl
if [[ $? != 0 ]] ; then
	brew install curl
fi

which -s nmap
if [[ $? != 0 ]] ; then
	brew install nmap
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

# Reload profile.
# ===============
source ~/.bash_profile
