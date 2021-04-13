#!/bin/bash

##### Ccls Setup
## Create a .ccls file
if [ ! -f /tmp/foo.txt ]; then
  echo "No .ccls file in main, creating it"
  echo '%compile_commands.json' >> ~/main/.ccls
fi

## For ccls C++ completion: generate the compile_commands.json
cd ~/catkin_ws
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=YES

## Place it in the top level folder
mv ~/catkin_ws/build/compile_commands.json ~/main

