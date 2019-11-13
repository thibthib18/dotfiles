#/bin/bash

sudo apt update

sudo apt install zsh git curl 

# change default shell to zsh
chsh -s $(which zsh)

# Zsh and its antigen plug-in manager
sudo apt-get install zsh-antigen # version from Ubuntu repo is broken
sudo curl -o /usr/share/zsh-antigen/antigen.zsh -sL git.io/antigen

# Link the config files with the dotfiles 
mv zshrc ~/.zshrc

