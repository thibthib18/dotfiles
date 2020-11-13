
# Map config from repo
cd /home/sv/.config
ln -s ~/main/docker/build_images/sv_dop_development/resources/thib/nvim nvim
#ln -s ~/main/docker/build_images/sv_dop_development/resources/thib/coc coc

# Install Neovim > 0.3.0
wget https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-linux64.tar.gz
sudo mv nvim-linux64.tar.gz /opt
cd /opt/
sudo tar -xf nvim-linux64.tar.gz

echo "************"
echo "Neovim v0.4.4 installed"
echo "************"

# Append to bashrc
echo 'export PATH=/opt/nvim-linux64/bin:$PATH' >> /home/sv/.bashrc
echo "alias vim='nvim'" >> /home/sv/.bashrc

source /home/sv/.bashrc

echo "************"
echo "Bashrc updated and reloaded"
echo "************"

# Install Vim-plug Plugin Manager
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

echo "************"
echo "Vim-plug installed"
echo "************"

# Run PlugInstall
/opt/nvim-linux64/bin/nvim --headless +PlugInstall +q
/opt/nvim-linux64/bin/nvim -c 'PlugInstall|qa'

echo "************"
echo "PlugInstall runned"
echo "************"

# Install Coc extensions
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-eslint|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-json|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-marketplace|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-pairs|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-prettier|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-python|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-snippets|qa'
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-tsserver|qa'
echo "Just missing Ccls"
/opt/nvim-linux64/bin/nvim -c 'CocInstall -sync coc-ccls|qa'

# Ccls Setup
## Create a .ccls file
echo '%compile_commands.json' >> ~/main/.ccls

## For ccls C++ completion: generate the compile_commands.json
cd /home/sv/catkin_ws
catkin_make -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=YES
## Place it in the top level folder
mv ~/catkin_ws/build/compile_commands.json ~/main

# For Jedi's python completion: install jedi package
pip3 install -U jedi
