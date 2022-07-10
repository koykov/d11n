#!/bin/bash

git pull

rm -rf build
mkdir -p build
cd build

cmake .. &> ../logs/cbuild.log
make &> ../logs/build.log
cd ..
cp build/zmqbroker bin/zeromq

./bin/zeromq config/zeromq.json &> logs/zeromq-`date +%Y.%m.%d_%H:%M`.log
