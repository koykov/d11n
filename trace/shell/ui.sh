#!/bin/bash

git checkout -- .
git pull
npm install
npm run build

service nginx start
sleep infinity
