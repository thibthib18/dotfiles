
# Source ROS setup
source /opt/ros/melodic/setup.zsh
export ROSCONSOLE_FORMAT='[${severity}] [${node}] [${time}]: ${message}'
alias rosvar="echo ROS_MASTER_URI=$ROS_MASTER_URI && echo ROS_IP=$ROS_IP && echo ROS_HOSTNAME=$ROS_HOSTNAME"
export ROS_MASTER_URI='http://129.132.28.163:11311'

