#!/bin/bash

# Install Coc extensions
plugins=( coc-eslint coc-json coc-marketplace coc-pairs coc-prettier coc-python coc-prettier coc-snippets coc-tsserver coc-ccls)
for cocPlugin in "${plugins[@]}"
do
    echo "Installing $cocPlugin...."
    /opt/nvim-linux64/bin/nvim --headless -c "CocInstall -sync $cocPlugin|qa"
    echo "$cocPlugin installed"
done

##### Ccls Setup
## Create a .ccls file
#echo '%compile_commands.json' >> ~/main/.ccls
## For ccls C++ completion: generate the compile_commands.json
#cd /home/sv/catkin_ws
#catkin_make -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
## Place it in the top level folder
#mv ~/catkin_ws/build/compile_commands.json ~/main

# For Jedi's python completion: install jedi package
pip3 install -U jedi

# Fix a bug a coc-ccls:
cd ~/.config/coc/extensions/node_modules/coc-ccls
ln -s node_modules/ws/lib lib




