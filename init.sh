#/bin/bash

sudo apt update

sudo apt install zsh git curl guake vim tmux

# For vim clipboard functionality
sudo apt install vim-gtk

# Vim-plug plug-in manager
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim


# Zsh and its antigen plug-in manager
chsh -s $(which zsh)

sudo apt-get install zsh-antigen # version from Ubuntu rep is broken
sudo curl -o /usr/share/zsh-antigen/antigen.zsh -sL git.io/antigen

# powerlevel9k
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install


# Remove previous config files
rm -rf ~/.vim ~/.vimrc ~/.zshrc ~/.tmux ~/.tmux.conf ~/.config/nvim 2> /dev/null

# Link the config files with the dotfiles 
ln -s ~/dotfiles/zshrc ~/.zshrc
ln -s ~/dotfiles/tmux.conf ~/.tmux.conf
ln -s ~/dotfiles/vimrc ~/.vimrc
ln -s ~/dotfiles/ctags ~/.ctags

mkdir -p ~/.bin
wget -O ~/.bin/tmuxinator.zsh https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.zsh



# Install utilities

	# npm
	curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
	sudo apt install nodejs ctop

	# how2 (stack overflow from terminal)
	npm install -g how-2

	# ag
	sudo apt install silversearcher-ag







