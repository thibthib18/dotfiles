#!/bin/bash

# Checkout run dev script from my branch
#cd ~/main
#git checkout thib_dev_image -- docker/run_containers/run_dev.sh
#./docker/run_containers/run_dev.sh

docker run -dti \
  --name thib_dev \
  --net host \
  --volume /var/run/docker.sock:/var/run/docker.sock \
  dev_thib
