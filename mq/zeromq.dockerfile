FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:maxmind/ppa
RUN apt-get update -
RUN apt-get install -y gcc libtool pkg-config build-essential autoconf automake wget git cmake libzmq3-dev openssh-server

RUN git clone https://github.com/koykov/zmqbroker.git /opt/broker
WORKDIR /opt/broker

RUN ln -s shell/zeromq.sh run.sh

CMD /bin/bash run.sh
