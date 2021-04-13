#!/bin/bash


function install_neovim {
    # Install Neovim > 0.5.0
    wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
    sudo mv nvim-linux64.tar.gz /opt
    cd /opt/
    sudo tar -xf nvim-linux64.tar.gz
    pip3 install neovim
}

function install_vim_plug {
    # Install Vim-plug Plugin Manager
    curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}

function run_plug_install {
    /opt/nvim-linux64/bin/nvim --headless -c "PlugInstall|qa"
}


install_neovim
install_vim_plug
run_plug_install
