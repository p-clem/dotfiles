#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    # flags should pass through the the `brew list check`
    'macvim --with-override-system-vim'
    ack
    diff-so-fancy
    #fzf
    git
    #highlight
    hub
    neovim/neovim/neovim
    the_silver_searcher
    tmux
    tree
    wget
    #z
    zsh
    git-standup
    entr
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
