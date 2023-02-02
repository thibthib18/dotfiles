ARG BASE_IMAGE=seervision/development:latest
FROM $BASE_IMAGE

ARG USER_ID=1000
ARG GROUP_ID=1000

USER root
WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive
ENV IS_DOCKER_BUILD=1

RUN apt-get update && \
      apt-get -y install sudo software-properties-common

RUN apt-get update && apt-get -y install \
                        wget curl git \
                        python3 \
                        zsh \
                        httpie \
                        python3-pip ipython3 \
                        python3-venv \
                        mongodb-clients \
                        silversearcher-ag xclip xsel

# Rust
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y

# Fix some python version issues atm
RUN ln -s /usr/lib/python3/dist-packages/apt_pkg.cpython-36m-x86_64-linux-gnu.so /usr/lib/python3/dist-packages/apt_pkg.so && \
    update-alternatives --config python3 && \
    mv /usr/bin/python3 /usr/bin/python3.bk && \
    ln -s /usr/bin/python3.6 /usr/bin/python3

# Ripgrep
RUN add-apt-repository ppa:x4121/ripgrep -y && apt update && apt install ripgrep

# Needed for C++ completion
RUN apt-get -y install llvm cmake clangd-10
RUN apt -y install zlib1g-dev libncurses-dev rapidjson-dev clang libclang-dev

ARG user=sv
USER $user
ENV USER=${user_name}
WORKDIR /home/$user

# Temp fix for python3
RUN python3 -m pip install --user --upgrade pip

# Install node.js
RUN wget install-node.now.sh/lts && \
    chmod u+x lts && \
    sudo ./lts --yes && \
    rm ./lts && \
    mkdir -p ~/.config

# Install lua formatter
# RUN sudo npm install -g lua-fmt

# Add dotfiles repo
ADD . /home/$user/dotfiles
RUN sudo chown -R ${user}:${user} ~/dotfiles
WORKDIR /home/${user}/dotfiles

# Install glab CLI
RUN curl -sL https://j.mp/glab-cli | sudo sh
RUN glab auth login --stdin < ./personal/glab_pat.token

# Install tmux
RUN ./docker/dev/scripts/install_tmux.sh

# Setup symlinks
RUN ./docker/dev/scripts/setup_symlinks.sh


# Remove current packer_compiled
RUN rm -f ./config/nvim/plugin/packer_compiled.lua

# Install and setup nvim
RUN ./docker/dev/scripts/nvim/install_nvim.sh && ./docker/dev/scripts/nvim/setup.sh

# Install lua-mongo
# RUN ./docker/dev/scripts/nvim/mongo-nvim/install.sh

# Install latest git
RUN ./docker/dev/scripts/install_git.sh

# Install tpm tmux plugin manager
RUN git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm && ~/.tmux/plugins/tpm/scripts/install_plugins.sh

# Install antigen zsh plugin manager
RUN sudo apt-get install zsh-antigen # version from Ubuntu rep is broken
RUN sudo curl -o /usr/share/zsh-antigen/antigen.zsh -sL git.io/antigen
RUN zsh -c "source ~/.zshrc"

# Install docker
RUN ./docker/dev/scripts/install_docker.sh

# Revert python version hack
RUN sudo rm /usr/bin/python3 && sudo mv /usr/bin/python3.bk /usr/bin/python3

# Set default shell
RUN sudo chsh -s $(which zsh) ${user}

# Source once
#RUN zsh -c "source ~/.zshrc"

ENV IS_DOCKER_BUILD=0

# Avoid long user id remapping when starting container, by updating it directly in the image
USER root
RUN chown -R $USER_ID:$GROUP_ID /home/$user

# Replace main with a symlink to code dir for git worktrees
WORKDIR /home/${user}
RUN rm -rf /home/${user}/main
RUN ln -s /home/${user}/code/main main

WORKDIR /home/$user/main
CMD ["/usr/bin/zsh"]
