#!/bin/bash

# Remove old link´s.
# ===============
if [ -f ~/.bash_profile ]; then
  unlink ~/.bash_profile
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
ln -s ~/.myterm/bash/dotfiles/vimrc ~/.vimrc
ln -s ~/.myterm/bash/dotfiles/gitignore_global ~/.gitignore_global

# Run several config commands.
# ============================

# Configure git:
git config --global core.excludesfile ~/.gitignore_global

# Open Terminal.app to configure theme.
open .myterm/bash/theme/Solarized\ Dark\ ansi.terminal

# Reload profile.
# ===============
source ~/.bash_profile
