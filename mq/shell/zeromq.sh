#!/bin/bash

rm -rf build
mkdir -p build
cd build

curl -s https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp > ../zsrc/zmq.hpp
cmake ../zsrc &> ../logs/cbuild.log
make &> ../logs/build.log
cd ..
cp build/zeromq bin/zeromq

./bin/zeromq &> log/zeromq-`date +%Y.%m.%d_%H:%M`.log
