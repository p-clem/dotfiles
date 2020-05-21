#!/usr/bin/env bash

# Start
echo "$(basename "$0") starting."

# homebrew options
export HOMEBREW_CASK_OPTS="--require-sha"

# Ask for the administrator password upfront
sudo -v

# install applications
brew cask install appcleaner
brew cask install alfred
brew cask install firefox
brew cask install google-chrome
brew cask install alacritty
brew cask install java
brew cask install spotify
brew cask install karabiner-elements
#brew cask install docker
#brew cask install virtualbox

# cleanup unneeded files
brew cleanup

# Finished
echo "$(basename "$0") complete."
