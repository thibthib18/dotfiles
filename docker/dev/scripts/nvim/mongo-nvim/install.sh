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
sudo apt -y install lua5.1 liblua5.1-0-dev luarocks
git clone https://github.com/neoxic/lua-mongo.git
cd lua-mongo
cmake -D USE_LUA_VERSION=5.1
make
make install
# Install somehow doesn't do this correctly?
cp mongo.so /usr/local/lib/lua/5.1/mongo.so
cd ..
rm -rf lua-mongo
