#!/bin/bash

## For C++ completion: generate the compile_commands.json
cd ~/catkin_ws
catkin_make -DCMAKE_EXPORT_COMPILE_COMMANDS=YES

## Place it in the top level folder
mv ~/catkin_ws/build/compile_commands.json ~/main

