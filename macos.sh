#!/bin/bash

# Enable tap to click for the trackpad (restart could be required)
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write /Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Move Dock to the left
defaults write com.apple.dock orientation -string "left"
# Hide dock
defaults write com.apple.dock autohide -bool true

# Remap capslock to command key
hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E7}]}'

# TODO:
# scroll direction on trackpad

# Restarting
killall SystemUIServer
killall Dock
