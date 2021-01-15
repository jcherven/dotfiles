#!/usr/bin/env bash

function set_macos_settings {
  # MacOS 10.13 specific config settings {{{
  # Close any open System Preferences panes
  osascript -e 'tell application "System Preferences" to quit'

  # Ask for the administrator password upfront
  sudo -v

  # Keep-alive: update existing `sudo` time stamp until `.macos` has finished
  while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

  # Set computer name (as done via System Preferences → Sharing)
  sudo scutil --set ComputerName "celery"
  sudo scutil --set HostName "celery"
  sudo scutil --set LocalHostName "celery"
  sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "celery"

  # Disable the crash reporter
  # defaults write com.apple.CrashReporter DialogType -string "none"

  # Disable typing assistance features
  defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
  defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

  # Trackpad: enable tap to click for this user and for the login screen
  defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
  defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
  defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

  # Tune the keyboard repeat rate
  # Normal default is 6; Normal minimum is 2 (30ms)
  defaults write NSGlobalDomain KeyRepeat -int 2
  # Normal default is 68; Normal minimum is 15 (225ms)
  defaults write NSGlobalDomain InitialKeyRepeat -int 15
  # Disable the Appple Press And Hold for alternate chars on long presses (interferes with some apps)
  defaults write com.microsoft.VSCode ApplePressAndHoldEnabled -bool false

  # Set language and text formats
  defaults write NSGlobalDomain AppleLanguages -array "en" "ja" "ko"

  # Show language menu in the top right corner of the boot screen
  sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true

  # Highlight Color to "Purple" (finder and UI windows)
  # The formula for custom colors is the color's RGB numeric value / 255 (six figures behind decimal); 255 is 1.000000
  # defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000"
  # Highlight Color to the custom Miku green
  defaults write NSGlobalDomain AppleHighlightColor -string "0.000000 1.000000 0.600000"

  # Finder: show hidden files by default
  defaults write com.apple.finder AppleShowAllFiles -bool true

  # Finder: show all filename extensions
  defaults write NSGlobalDomain AppleShowAllExtensions -bool true

  # Finder: show status bar
  defaults write com.apple.finder ShowStatusBar -bool true

  # Finder: show path bar
  defaults write com.apple.finder ShowPathbar -bool true

  # Keep folders on top when sorting by name
  defaults write com.apple.finder _FXSortFoldersFirst -bool true

  # When performing a search, search the current folder by default
  defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

  # Show item info to the right of the icons on the desktop
  /usr/libexec/PlistBuddy -c "Set DesktopViewSettings:IconViewSettings:labelOnBottom false" ~/Library/Preferences/com.apple.finder.plist

  # Use list view in all Finder windows by default
  # Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
  defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

  # Show the ~/Library folder
  chflags nohidden ~/Library

  # Show the /Volumes folder
  sudo chflags nohidden /Volumes

  # Set the default Finder location to the home folder
  defaults write com.apple.finder NewWindowTargetPath -string "file://${HOME}"

  # Don’t automatically rearrange Spaces based on most recent use

  # Automatically hide and show the Dock
  defaults write com.apple.dock autohide -bool true

  # Terminal: Enable Secure Keyboard Entry in Terminal.app
  # See: https://security.stackexchange.com/a/47786/8918
  defaults write com.apple.terminal SecureKeyboardEntry -bool true

#}}}
}

if [[ "$OSTYPE" == "darwin"* ]]; then
  set_macos_settings
else
  echo "Skipping macosinit.sh"
fi

# ex: set foldmethod=marker:
