#!/bin/bash

sudo groupmod docker -g $(stat -c '%G' /var/run/docker.sock)
# Reload docker group
newgrp docker
