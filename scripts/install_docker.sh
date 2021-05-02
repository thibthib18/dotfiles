#!/bin/sh

sudo curl -sS https://get.docker.com/ | sh

sudo usermod -aG docker $(whoami)
