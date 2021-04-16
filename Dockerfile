FROM seervision/development:latest

USER root
WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get -y install wget curl git\
                        python3 \
                        zsh \
                        python3-pip ipython3 \
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

USER sv
WORKDIR /home/sv

# Install node.js
RUN wget install-node.now.sh/lts
RUN chmod u+x lts
RUN sudo ./lts --yes
RUN rm ./lts
RUN mkdir -p ~/.config

# Install yarn
RUN sudo npm install -g yarn

# Add dotfiles repo
ADD . /home/sv/dotfiles
RUN sudo chown -R sv:sv ~/dotfiles
WORKDIR /home/sv/dotfiles

# Copy config files
RUN mkdir -p ~/.config

RUN ln -s ~/dotfiles/config/nvim ~/.config/nvim
RUN ln -s ~/dotfiles/config/tmux ~/.config/tmux
RUN ln -s ~/dotfiles/config/zsh ~/.config/zsh

RUN ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc

RUN rm ~/.tmux.conf
RUN ln -s ~/dotfiles/config/tmux/tmux.conf ~/.tmux.conf

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

# Set default shell
RUN sudo chsh -s $(which zsh) sv

# Source once
RUN zsh -c "source ~/.zshrc"

USER root
WORKDIR /home/sv/main
CMD ["/usr/bin/zsh"]
