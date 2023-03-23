#!/bin/bash

function install_from_source(){
    # Install deps
    sudo apt-get -y install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
    # Build latest stable
    git clone https://github.com/neovim/neovim
    cd neovim
    git checkout stable
    make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_EXTRA_FLAGS="-DCMAKE_INSTALL_PREFIX=/opt/nvim-linux64"
    sudo make install
    cd ..
    rm -rf neovim
}

function install_release(){
    wget https://github.com/neovim/neovim/releases/download/v0.8.1/nvim-linux64.tar.gz
    sudo mv nvim-linux64.tar.gz /opt
    cd /opt/
    sudo tar -xf nvim-linux64.tar.gz
}

function install_neovim {
    if [[ $(lsb_release -rs) == "18.04" ]]; then
        install_from_source
    else
        install_release
    fi
    pip3 install neovim
}

install_neovim
