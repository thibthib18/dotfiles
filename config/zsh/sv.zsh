
source ~/catkin_ws/devel/setup.zsh

# Get the interesting part of bashrc
tail +119 ~/.bashrc > ~/.bashrc.short
# Replace a bunch of source setup.bash with setup.zsh
sed -i 's/bash/zsh/g' ~/.bashrc.short
# Use zsh smartness
emulate sh -c 'source ~/.bashrc.short'
