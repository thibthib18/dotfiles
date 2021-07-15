#!/bin/sh

mkdir -p ~/.config

ln -s ~/dotfiles/config/nvim ~/.config/nvim
ln -s ~/dotfiles/config/tmux ~/.config/tmux
ln -s ~/dotfiles/config/zsh ~/.config/zsh

ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc

rm -f ~/.tmux.conf
ln -s ~/dotfiles/config/tmux/tmux.conf ~/.tmux.conf

mkdir -p ~/.local/share/nvim/plugged
ln -s ~/.local/share/nvim/plugged ~/plugged

