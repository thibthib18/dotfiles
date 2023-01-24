
apt-get -y install wget tar libevent-dev libncurses-dev
src_path=/tmux-src
tmux_version=3.2a
VERSION=${tmux_version}
mkdir ${src_path}
wget -qO- https://github.com/tmux/tmux/releases/download/${VERSION}/tmux-${VERSION}.tar.gz | tar xvz -C ${src_path}
cd ${src_path}/tmux-${tmux_version}
./configure && make -j"$(nproc)" && sudo make install
cd && rm -rf ${src_path}
