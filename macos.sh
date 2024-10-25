#!/bin/bash

# Enable tap to click for the trackpad (restart could be required)
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write /Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Move Dock to the left
defaults write com.apple.dock orientation -string "left"
# Hide dock
defaults write com.apple.dock autohide -bool true

# TODO:
# scroll direction on trackpad

# Restarting
killall SystemUIServer
killall Dock
