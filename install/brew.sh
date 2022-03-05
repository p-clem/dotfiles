#!/bin/sh

if test ! $(which brew); then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/pclement/.zprofile
    eval "$(/opt/homebrew/bin/brew shellenv)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    cask
    diff-so-fancy
    git
    node
    ripgrep
    python3
    jq
    k9s
    neovim/neovim/neovim
    tmux
    tree
    wget
    fzf
    httpie
    z
    tldr
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
