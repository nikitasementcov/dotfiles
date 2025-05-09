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

dockutil --add "/Applications/Alacritty.app" --no-restart | true
dockutil --add "/Applications/Notion.app" --no-restart | true
# dockutil --add "/Applications/Notion Calendar.app" --no-restart | true
dockutil --add "/Applications/Google Chrome.app" --no-restart | true
dockutil --add "/Applications/Spotify.app" --no-restart | true
dockutil --add "/Applications/Mail.app" --no-restart | true
dockutil --add "/Applications/Microsoft Teams.app" --no-restart | true
dockutil --add "/Applications/Telegram.app" --no-restart | true
dockutil --add "/Applications/Things3.app" --no-restart | true

# Remap capslock to command key (one of the way to do that without karabiner)
# hidutil property --set '{"UserKeyMapping":[{"HIDKeyboardModifierMappingSrc":0x700000039,"HIDKeyboardModifierMappingDst":0x7000000E7}]}' | true
# hidutil property --set '{"UserKeyMapping":[]}' | true # to revert

# Set the Touch Bar to show F1-F12 keys by default
defaults write com.apple.touchbar.agent PresentationModeGlobal -string "functionKeys"

# Use F1, F2, etc. as standard function keys (for MacBook with Touch Bar)
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true

# Disable minimizing windows into the application icon
defaults write com.apple.dock minimize-to-application -bool false

# Set the Globe/Fn key to "Do Nothing"
defaults write com.apple.HIToolbox AppleFnUsageType -int 0

# Set preferred languages to English (US) and Russian, removing all others
defaults write NSGlobalDomain AppleLanguages -array "en-US" "ru"

# Always show hidden files (dotfiles) in Finder
defaults write com.apple.finder AppleShowAllFiles -bool true

# Set system time format to 24-hour
defaults write NSGlobalDomain AppleICUForce24HourTime -bool true

# Anki settings
defaults write net.ankiweb.dtop NSAppSleepDisabled -bool true
defaults write net.ichi2.anki NSAppSleepDisabled -bool true
defaults write org.qt-project.Qt.QtWebEngineCore NSAppSleepDisabled -bool true

# Restarting
killall SystemUIServer
killall Dock
killall ControlStrip
killall Finder

echo "Done"
