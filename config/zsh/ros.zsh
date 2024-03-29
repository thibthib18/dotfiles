
# Source ROS setup
source /opt/ros/noetic/setup.zsh
export ROSCONSOLE_FORMAT='[${severity}] [${node}] [${time}]: ${message}'
alias rosvar="echo ROS_MASTER_URI=$ROS_MASTER_URI && echo ROS_IP=$ROS_IP && echo ROS_HOSTNAME=$ROS_HOSTNAME"


function auto_cd_catkin_make {
  (cd ~/catkin_ws; catkin_make $@)
}

alias cm="auto_cd_catkin_make"
