npm i -g neovim
pip3 install neovim

# Install vim plugins
echo "Installing vim plugins. This may take some time..."
vim +'PlugInstall --sync' +qall &> /dev/null

