ARG BASE_IMAGE=seervision/development:latest
FROM $BASE_IMAGE

USER root
WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get -y install wget curl git\
                        python3 \
                        zsh \
                        python3-pip ipython3 \
                        python3-venv \
                        silversearcher-ag xclip xsel

# Needed to build tmux
RUN apt-get -y install wget tar libevent-dev libncurses-dev
ARG src_path=/tmux-src
ARG tmux_version=2.6
RUN VERSION=${tmux_version} && \
    mkdir ${src_path} && \
    wget -qO- https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz | tar xvz -C ${src_path}
WORKDIR ${src_path}/tmux-${tmux_version}
RUN ls
RUN ./configure && make -j"$(nproc)" && sudo make install
RUN cd && rm -rf ${src_path}


# Needed for C++ completion
RUN apt-get -y install llvm cmake clangd-10
RUN apt -y install zlib1g-dev libncurses-dev rapidjson-dev clang libclang-dev

ARG user=sv
USER $user
ENV USER=${user_name}
WORKDIR /home/$user

# Install node.js
RUN wget install-node.now.sh/lts
RUN chmod u+x lts
RUN sudo ./lts --yes
RUN rm ./lts
RUN mkdir -p ~/.config

# Install yarn
RUN sudo npm install -g yarn

# Add dotfiles repo
ADD . /home/$user/dotfiles
RUN sudo chown -R ${user}:${user} ~/dotfiles
WORKDIR /home/$user/dotfiles

# Copy config files
RUN mkdir -p ~/.config

RUN ln -s ~/dotfiles/config/nvim ~/.config/nvim
RUN ln -s ~/dotfiles/config/tmux ~/.config/tmux
RUN ln -s ~/dotfiles/config/zsh ~/.config/zsh

RUN ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc

RUN rm -f ~/.tmux.conf
RUN ln -s ~/dotfiles/config/tmux/tmux.conf ~/.tmux.conf

RUN mkdir -p ~/.ipython/profile_default
RUN ln -s ~/dotfiles/config/ipython/ipython_config.py ~/.ipython/profile_default/ipython_config.py

RUN mkdir -p ~/.local/share/nvim/plugged
RUN ln -s ~/.local/share/nvim/plugged ~/plugged
# Install and setup nvim
RUN ./scripts/nvim/install_nvim.sh
RUN ./scripts/nvim/setup.sh

# Install tpm tmux plugin manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
RUN ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Install antigen zsh plugin manager
RUN sudo apt-get install zsh-antigen # version from Ubuntu rep is broken
RUN sudo curl -o /usr/share/zsh-antigen/antigen.zsh -sL git.io/antigen
RUN zsh -c "source ~/.zshrc"

# Install docker
RUN ./scripts/install_docker.sh

# Set default shell
RUN sudo chsh -s $(which zsh) ${user}

# Source once
RUN zsh -c "source ~/.zshrc"

USER root
WORKDIR /home/$user/main
CMD ["/usr/bin/zsh"]
