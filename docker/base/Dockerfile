FROM ubuntu:18.04

USER root
WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
      apt-get -y install sudo


# Create sudo user
ARG user=thib
ENV USER=${user}
RUN useradd -u 1000 -s /usr/bin/zsh -m ${user} \
  && usermod -aG sudo,video,dialout ${user} \
  && echo "${user} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${user} \
  && chmod 0440 /etc/sudoers.d/${user}

USER $user
WORKDIR /home/$user

