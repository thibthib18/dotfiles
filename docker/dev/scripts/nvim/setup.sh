#!/bin/bash


# Add python2 support
python2 -m pip install --user --upgrade pynvim

# For Jedi's python completion: install jedi package
pip3 install -U jedi

# Lua lsp
~/dotfiles/docker/dev/scripts/nvim/lua-language-server/install.sh

