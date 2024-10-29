#!/bin/bash

# Enable tap to click for the trackpad (restart could be required)
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
sudo defaults write /Library/Preferences/com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
# Enable natural scrolling for the trackpad
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool true

# Move Dock to the left
defaults write com.apple.dock orientation -string "left"
# Hide dock
defaults write com.apple.dock autohide -bool true
# Clean dock items
defaults write com.apple.dock persistent-apps -array

# Remap capslock to command key (one of the way to do that without karabiner)
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E7}]}' | true
# hidutil property --set '{"UserKeyMapping":[]}' | true # to revert

# Set the Touch Bar to show F1-F12 keys by default
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "functionKeys"

# Use F1, F2, etc. as standard function keys (for MacBook with Touch Bar)
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Restarting
killall SystemUIServer
killall Dock
killall ControlStrip

echo "Done"
