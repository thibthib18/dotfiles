#!/bin/bash


# Add python2 support
python2 -m pip install --user --upgrade pynvim

# Install Coc extensions
plugins=( coc-eslint coc-json coc-marketplace coc-pairs coc-jedi coc-pyright coc-prettier coc-snippets coc-tsserver coc-clangd)
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


