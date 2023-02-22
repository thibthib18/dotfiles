#!/bin/sh

mkdir -p ~/.config

ln -s ~/dotfiles/config/nvim ~/.config/nvim
ln -s ~/dotfiles/config/tmux ~/.config/tmux
ln -s ~/dotfiles/config/zsh ~/.config/zsh

ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc

rm -f ~/.tmux.conf
ln -s ~/dotfiles/config/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.ipython/profile_default
ln -svf ~/dotfiles/config/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py

mkdir -p ~/.local/share/nvim/site/pack/packer/start
ln -s ~/.local/share/nvim/site/pack/packer/start ~/plugged

ln -s ~/dotfiles/config/pyrightconfig.json ~/pyrightconfig.json
