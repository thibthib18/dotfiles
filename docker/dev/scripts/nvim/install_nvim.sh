#!/bin/bash

function install_from_source(){
  # Install deps
  sudo apt-get install ninja-build gettext libtool libtool-bin autoconf automake cmake g++ pkg-config unzip curl doxygen
  # Build latest stable
  git clone https://github.com/neovim/neovim
  cd neovim
  git checkout stable
  make CMAKE_BUILD_TYPE=RelWithDebInfo CMAKE_INSTALL_PREFIX=/opt
  sudo make install
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

function run_packer_install {
    /opt/nvim-linux64/bin/nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
}


install_neovim
run_packer_install
