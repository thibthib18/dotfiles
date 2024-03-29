
source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Laravel Artisan completion
antigen bundle jessarcher/zsh-artisan

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Auto suggestions
antigen bundle zsh-users/zsh-autosuggestions

# Docker aliases
antigen bundle "akarzim/zsh-docker-aliases"

# Docker completion
antigen bundle docker


# POWERLEVEL10k
source ~/dotfiles/config/zsh/powerline.zsh
# Tell Antigen that you're done.
antigen apply
