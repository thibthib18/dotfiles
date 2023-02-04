#!/bin/sh
#
sudo apt-get install zsh-antigen
# version from Ubuntu rep is broken, needs to install this one too
sudo curl -o /usr/share/zsh-antigen/antigen.zsh -sL git.io/antigen
zsh -c "source ~/.zshrc"
