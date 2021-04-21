#!/bin/bash

# Dependency
sudo apt -y install ninja-build
sudo apt install -y libglib2.0-dev g++ gcc libgcc-8-dev clang linux-headers-amd64 luarocks

# Update gcc and g++
sudo add-apt-repository ppa:ubuntu-toolchain-r/test -y
sudo apt-get update

sudo apt -y install gcc-9 g++-9
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 100
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 100

# Clone
git clone https://github.com/sumneko/lua-language-server
cd lua-language-server
git submodule update --init --recursive

# Build
cd 3rd/luamake
compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild

# Install
cd ..
mkdir -p ~/.cache/nvim/nlua/sumneko_lua/
mv lua-language-server ~/.cache/nvim/nlua/sumneko_lua/

# Run
 # ./bin/Linux/lua-language-server -E ./main.lua

