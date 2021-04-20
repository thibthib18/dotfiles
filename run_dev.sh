#!/bin/bash

# Checkout run dev script from my branch
cd ~/main
git checkout thib_dev_image -- docker/run_containers/run_dev.sh
./docker/run_containers/run_dev.sh
