#!/bin/bash

# Create link for launch SublimeText in Terminal:
ln -s "/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl" /usr/bin/subl

# Remove current settings and link my custom settings:
if [ -f ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ]; then
  rm ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
fi
ln -s ~/.myterm/configs/st2/settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings

# Install plugins:
git clone git://github.com/randy3k/AlignTab               ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/AlignTab
git clone git://github.com/jisaacks/GitGutter.git         ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/GitGutter
git clone git://github.com/henrikpersson/rsub.git         ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/rsub
git clone git://github.com/eklein/sublime-text-puppet.git ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/sublime-text-puppet
git clone git://github.com/kkga/spacegray.git             ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/spacegray
