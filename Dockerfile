FROM ubuntu:18.04

USER root
WORKDIR /

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
      apt-get -y install sudo

RUN apt-get -y install wget curl git\
                        python3 \
                        zsh \
                        python3-pip ipython3 \
                        silversearcher-ag

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
RUN apt-get -y install llvm cmake
# Install ccls
WORKDIR /
RUN apt -y install zlib1g-dev libncurses-dev rapidjson-dev clang libclang-dev
RUN git clone --depth=1 --recursive https://github.com/MaskRay/ccls
WORKDIR /ccls
RUN wget -c http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN tar xf clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz
RUN cmake -H. -BRelease -DCMAKE_BUILD_TYPE=Release -DCMAKE_PREFIX_PATH=$PWD/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04
RUN cmake --build Release
WORKDIR /ccls/Release
RUN make install
WORKDIR /
RUN rm -rf /ccls


# Create thib user
ARG user_name=thib
ENV USER=${user_name}
RUN useradd -u 1000 -s /usr/bin/zsh -m ${user_name} \
  && usermod -aG sudo,video,dialout ${user_name} \
  && echo "${user_name} ALL=(root) NOPASSWD:ALL" > /etc/sudoers.d/${user_name} \
  && chmod 0440 /etc/sudoers.d/${user_name}

USER thib
WORKDIR /home/thib

# Install node.js
RUN wget install-node.now.sh/lts
RUN chmod u+x lts
RUN sudo ./lts --yes
RUN rm ./lts
RUN mkdir -p ~/.config

# Install yarn
RUN sudo npm install -g yarn

# Add dotfiles repo
ADD . /home/thib/dotfiles
RUN sudo chown -R thib:thib ~/dotfiles
WORKDIR /home/thib/dotfiles

# Copy config files
RUN mkdir -p ~/.config/nvim
RUN ln -s ~/dotfiles/config/nvim/init.vim ~/.config/nvim
RUN ln -s ~/dotfiles/config/zsh/zshrc ~/.zshrc
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

