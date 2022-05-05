#!/bin/bash

./build.sh
LOG="logs/demo-$(date +%Y.%m.%d_%H:%M).log"
./bin/trace-server &> $LOG
