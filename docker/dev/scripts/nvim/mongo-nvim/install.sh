
# Install luarocks
sudo apt -y install luarocks

# Install dependencies for mongo C driver
sudo apt -y install libzstd-dev libssl-dev

# Install Mongo C driver
git clone https://github.com/mongodb/mongo-c-driver.git
cd mongo-c-driver
python build/calc_release_version.py > VERSION_CURRENT
mkdir cmake-build
cd cmake-build
cmake -DENABLE_AUTOMATIC_INIT_AND_CLEANUP=OFF ..
make
sudo make install
cd ../..
rm -rf mongo-c-driver

# Install lua mongo driver
sudo apt install lua5.1
git clone https://github.com/neoxic/lua-mongo.git
cd lua-mongo
cmake -D USE_LUA_VERSION=5.1
make
make install
cd ..
rm -rf lua-mongo


