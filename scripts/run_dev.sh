#!/usr/bin/bash

docker run \
    -ti\
    --name devtest \
    --mount type=bind,source="$(pwd)",target=/home/thib/main \

