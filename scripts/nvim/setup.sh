#!/bin/bash

# Install Coc extensions
plugins=( coc-eslint coc-json coc-marketplace coc-pairs coc-prettier coc-python coc-prettier coc-snippets coc-tsserver coc-ccls)
for cocPlugin in "${plugins[@]}"
do
    echo "Installing $cocPlugin...."
    /opt/nvim-linux64/bin/nvim --headless -c "CocInstall -sync $cocPlugin|qa"
    echo "$cocPlugin installed"
done

# For Jedi's python completion: install jedi package
pip3 install -U jedi

# Fix a bug a coc-ccls:
cd ~/.config/coc/extensions/node_modules/coc-ccls
ln -s node_modules/ws/lib lib




