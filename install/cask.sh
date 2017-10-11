#!/usr/bin/env bash

isWorkMachine=false

# Start
echo "$(basename "$0") starting."

read -r -p "Is this a work machine? (y/n) " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]] ; then
    isWorkMachine=true
fi

# homebrew options
export HOMEBREW_CASK_OPTS="--require-sha"

# Ask for the administrator password upfront
sudo -v

# setup taps
brew tap caskroom/fonts
brew tap caskroom/cask

# install applications
brew cask install appcleaner
brew cask install docker
brew cask install alfred
brew cask install firefox
#brew cask install flux
brew cask install dash
brew cask install google-chrome
brew cask install iterm2
brew cask install java
#brew cask install skype
brew cask install atom
brew cask install sourcetree
#brew cask install totalspaces
brew cask install virtualbox
brew cask install spotify

# if this is not a work machine
if [[ $isWorkMachine == false ]] ; then
    brew cask install adobe-photoshop-lightroom
    brew cask install dropbox
    brew cask install vlc
    brew cask install dashlane
fi

# install fonts
brew cask install font-hasklig
brew cask install font-source-code-pro

# cleanup unneeded files
brew cleanup

# Finished
echo "$(basename "$0") complete."
