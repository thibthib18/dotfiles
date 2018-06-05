#/bin/bash


# Vim-plug plug-in manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Zsh and its antigen plug-in manager
sudo apt install zsh
chsh -s $(which zsh)

sudo apt-get install zsh-antigen


# Remove previous config files
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Link the config giles with the dotfiles 
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc

