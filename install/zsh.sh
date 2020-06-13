#!/usr/bin/env bash

if ! command_exists zsh; then
    echo "zsh not found. Installing..."
    if [ "$(uname)" == "Darwin" ]; then 
        bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
    else
      sudo apt install zsh
    fi
elif ! [[ $SHELL =~ .*zsh.* ]]; then
    echo "Configuring zsh as default shell"
    chsh -s $(which zsh)
fi

