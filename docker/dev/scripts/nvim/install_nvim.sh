#!/bin/bash


function install_neovim {
    # Install Neovim 0.6.0
    wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.tar.gz
    sudo mv nvim-linux64.tar.gz /opt
    cd /opt/
    sudo tar -xf nvim-linux64.tar.gz
    pip3 install neovim
}

function run_packer_install {
    /opt/nvim-linux64/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}


install_neovim
run_packer_install
