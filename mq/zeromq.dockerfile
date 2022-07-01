FROM ubuntu:22.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:maxmind/ppa
RUN apt-get update -
RUN apt-get install -y gcc libtool pkg-config build-essential autoconf automake wget git cmake libzmq3-dev openssh-server

WORKDIR /tmp
RUN wget https://github.com/zeromq/libzmq/releases/download/v4.3.4/zeromq-4.3.4.tar.gz
RUN tar xvzf zeromq-4.3.4.tar.gz
WORKDIR /tmp/zeromq-4.3.4
RUN ./configure && make && make install && ldconfig

RUN git clone https://github.com/koykov/d11n.git /opt/d11n
RUN ln -s /opt/d11n/mq /opt/broker
RUN cd /opt/broker
RUN wget -O zsrc/zmq.hpp https://raw.githubusercontent.com/zeromq/cppzmq/master/zmq.hpp

RUN ln -s shell/zeromq.sh run.sh
RUN ln -s config/zeromq.env .env

CMD /bin/bash run.sh
