#!/bin/sh

sudo curl -sS https://get.docker.com/ | sh

sudo usermod -aG docker $(whoami)

#NOTE: the mounted docker socket might have a different group
# id for the docker group, which may prevent to use docker without sudo at first.
