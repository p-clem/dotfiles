#!/usr/bin/env bash

# Start
echo "$(basename "$0") starting."

# homebrew options
export HOMEBREW_CASK_OPTS="--require-sha"

# Ask for the administrator password upfront
sudo -v

# install applications
brew install --cask firefox
brew install --cask java
brew install --cask spotify
brew install --cask karabiner-elements
brew install --cask docker

# cleanup unneeded files
brew cleanup

# Finished
echo "$(basename "$0") complete."
