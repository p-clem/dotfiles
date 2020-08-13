#!/usr/bin/env bash

command_exists() {
    type "$1" > /dev/null 2>&1
}

echo "Installing dotfiles."

echo "Initializing submodule(s)"
git submodule update --init --recursive

source install/git.sh
source install/brew.sh
source install/zsh.sh
source install/tmux.sh
source install/link.sh

echo "Installing npm packages"
source install/npm.sh

echo "Installing neovim dependencies"
source install/nvim.sh

echo "creating vim directories"
mkdir -p ~/.vim-tmp

echo "Done. Reload your terminal."
