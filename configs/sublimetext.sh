#!/bin/bash

# Create link for launch SublimeText in Terminal:
ln -s /Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl /usr/local/bin/subl

if [ -f ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ]; then
  rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
fi

ln -s ~/.myterm/configs/sublimetext.json ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

# Install Packages:
git clone https://github.com/kkga/spacegray.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/Theme\ \-\ Spacegray/
git clone https://github.com/kemayo/sublime-text-git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/sublime-text-git
git clone https://github.com/jisaacks/GitGutter.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/GitGutter
git clone https://github.com/randy3k/AlignTab.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/AlignTab