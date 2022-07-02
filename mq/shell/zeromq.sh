#!/bin/bash

git pull

rm -rf build
mkdir -p build
cd build

cmake ../zsrc &> ../logs/cbuild.log
make &> ../logs/build.log
cd ..
cp build/zeromq bin/zeromq

./bin/zeromq &> log/zeromq-`date +%Y.%m.%d_%H:%M`.log
