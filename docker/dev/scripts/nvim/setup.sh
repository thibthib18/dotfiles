#!/bin/bash


# Add python2 support
python2 -m pip install --user --upgrade pynvim

# For Jedi's python completion: install jedi package
pip3 install -U jedi

# Lua lsp
~/dotfiles/docker/dev/scripts/nvim/lua-language-server/install.sh

/opt/nvim-linux64/bin/nvim --headless +"CocUpdateSync" +qa #
/opt/nvim-linux64/bin/nvim --headless +"TSInstall lua cpp python typescript css bash dockerfile graphql tsx" +qa #
/opt/nvim-linux64/bin/nvim --headless +"PlugInstall" +qa #
