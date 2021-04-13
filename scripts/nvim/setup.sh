#!/bin/bash

# Install Coc extensions
plugins=( coc-eslint coc-json coc-marketplace coc-pairs coc-prettier coc-python coc-prettier coc-snippets coc-tsserver coc-clangd)
for cocPlugin in "${plugins[@]}"
do
    echo "Installing $cocPlugin...."
    /opt/nvim-linux64/bin/nvim --headless -c "CocInstall -sync $cocPlugin|qa"
    echo "$cocPlugin installed"
done

# Extra step for coc-clangd: install clangd
#/opt/nvim-linux64/bin/nvim --headless -c "CocCommand clangd.install|qa"

# For Jedi's python completion: install jedi package
pip3 install -U jedi

# Fix a bug a coc-ccls:
cd ~/.config/coc/extensions/node_modules/coc-ccls
ln -s node_modules/ws/lib lib




