

source /usr/share/zsh-antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Auto suggestions
antigen bundle zsh-users/zsh-autosuggestions


# Load the theme.
antigen theme ys

# Tell Antigen that you're done.
antigen apply


setopt auto_cd


# Always use tmux 
if [ "$TMUX" = "" ]; then tmux; fi


# Vi Mode
bindkey -v

# Kill The Lag
export KEYTIMEOUT=1

# Mode Indicator
# Updates editor information when the keymap changes.
function zle-keymap-select() {
  zle reset-prompt
  zle -R
}

zle -N zle-keymap-select

function vi_mode_prompt_info() {
  echo "${${KEYMAP/vicmd/[% NORMAL]%}/(main|viins)/[% INSERT]%}"
}


# Auto cd and ls
function chpwd() {
	emulate -L zsh
	ls --almost-all
}

# define right prompt, regardless of whether the theme defined it
RPS1='$(vi_mode_prompt_info)'
RPS2=$RPS1


# Better searching in command mode
bindkey -M vicmd '?' history-incremental-search-backward
bindkey -M vicmd '/' history-incremental-search-forward

# Beginning search with arrow keys
bindkey "^[OA" up-line-or-beginning-search
bindkey "^[OB" down-line-or-beginning-search
bindkey -M vicmd "k" up-line-or-beginning-search
bindkey -M vicmd "j" down-line-or-beginning-search

# Enable colors
autoload colors zsh/terminfo
colors

# Source ROS setup 
source /opt/ros/kinetic/setup.zsh
export ROSCONSOLE_FORMAT='[${severity}] [${node}] [${time}]: ${message}'
alias rosvar="echo ROS_MASTER_URI=$ROS_MASTER_URI && echo ROS_IP=$ROS_IP && echo ROS_HOSTNAME=$ROS_HOSTNAME"

setopt complete_aliases

# Copy to clipboard cmd (to use with piping)   -> copy the ouput of `cmd` to clipboard with :$ cmd | copy
alias copy="xclip -sel clip"

export EDITOR='vim'


# Issue finding tensorflow without this
export PYTHONPATH=/usr/local:$PYTHONPATH
export PYTHONPATH=$PYTHONPATH:/home/ubuntu/caffe2/build
export PATH=/home/thib/QtCreator/latest/bin:$PATH
export PATH=/home/thib/hdd/UE4/UnrealEngine-4.18.3-release/Engine/Binaries/Linux:$PATH


# tmuxinator
#source ~/.bin/tmuxinator.zsh

# i3 switch Caps_Lock and Escape
# xmodmap -e "clear lock"
# xmodmap -e "keysym Caps_Lock = Escape"
# OR
# setxkbdmap -layout us -option caps:escape



# Navio
export PATH=/home/thib/hdd/UE4.21/UnrealEngine/Engine/Binaries/Linux:/home/thib/hdd/UE4/UnrealEngine-4.18.3-release/Engine/Binaries/Linux:/home/thib/QtCreator/latest/bin:/opt/ros/kinetic/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/home/thib/.local/bin
