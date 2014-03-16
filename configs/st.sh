#!/bin/bash

# Create link for launch SublimeText in Terminal:
ln -s "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl

# Remove current settings and link my custom settings:
if [ -f ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ]; then
rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
fi
ln -s ~/.myterm/configs/st2/settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

# Install plugins:
git clone git://github.com/henrikpersson/rsub.git
