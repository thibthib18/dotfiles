
# Fix for sometimes USER not set. TODO: find proper fix
export USER=sv
source ~/catkin_ws/devel/setup.zsh

# Get the interesting part of bashrc
tail +119 ~/.bashrc > ~/.bashrc.short
# Replace a bunch of source setup.bash with setup.zsh
sed -i 's/bash/zsh/g' ~/.bashrc.short
# Use zsh smartness
emulate sh -c 'source ~/.bashrc.short'

# Update this function as our tmux version counts pane starting from 1
function launch_system() {
  first_command='new-session'

  if [ -n "$TMUX" ]; then
    first_command='new-window'
  fi

  tmux ${first_command} -n launcher \; \
    split-window -v -p 80 \; \
    split-window -h -p 30 \; \
    split-window -t 0 -h -p 30 \; \
    send-keys -t 0 'build_ui && sudo launch_ui' Enter \; \
    send-keys -t 1 'serve_manual' Enter \; \
    select-pane -t '2' \; \
    send-keys -t 2 ${1} Enter \; \
    send-keys -t 3 'launch_operations' Enter
}
