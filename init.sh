#/bin/bash

sudo apt update

sudo apt install zsh git curl guake vim

# Vim-plug plug-in manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Zsh and its antigen plug-in manager
chsh -s $(which zsh)

sudo apt-get install zsh-antigen


# Remove previous config files
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Link the config giles with the dotfiles 
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ctags ~/.ctags

mkdir -p ~/.bin
wget -O ~/.bin/tmuxinator.zsh https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh
