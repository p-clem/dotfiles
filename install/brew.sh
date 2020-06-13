#!/bin/sh

if test ! $(which brew); then
    echo "Installing homebrew"
    if [ "$(uname)" == "Darwin" ]; then 
    	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    else
      sudo apt update
      sudo apt upgrade -y
      bash -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh) -y"
      test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
      test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
      test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
      echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile
    fi
fi

echo -e "\n\nInstalling homebrew packages..."
echo "=============================="

formulas=(
    diff-so-fancy
    git
    node
    ripgrep
    python3
    neovim/neovim/neovim
    tmux
    tree
    wget
    fzf
)

for formula in "${formulas[@]}"; do
    if brew list "$formula" > /dev/null 2>&1; then
        echo "$formula already installed... skipping."
    else
        brew install $formula
    fi
done
