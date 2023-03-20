#!/bin/sh

wget https://gitlab.com/gitlab-org/cli/-/releases/v1.26.0/downloads/glab_1.26.0_Linux_x86_64.deb
sudo dpkg -i glab_1.26.0_Linux_x86_64.deb
rm glab_1.26.0_Linux_x86_64.deb
glab auth login --stdin < ./personal/glab_pat.token
