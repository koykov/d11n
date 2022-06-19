FROM ubuntu:22.04

RUN apt-get update --fix-missing
RUN apt-get install -y software-properties-common
RUN apt-get install -y gcc libtool pkg-config build-essential autoconf automake wget git cmake libzmq3-dev openssh-server

RUN mkdir -p /opt/broker
