#!/bin/bash

git pull
go mod tidy
go build -o bin/traced github.com/koykov/traced

LOG="logs/traced-$(date +%Y.%m.%d_%H:%M).log"
./bin/traced --config config/traced.json &> $LOG
