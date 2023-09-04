FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:maxmind/ppa
RUN apt-get update -
RUN apt-get install -y gcc libc6 libtool pkg-config build-essential autoconf automake wget git cmake openssh-server

WORKDIR /tmp
RUN wget https://github.com/zeromq/libzmq/releases/download/v4.2.2/zeromq-4.2.2.tar.gz
RUN tar xvzf zeromq-4.2.2.tar.gz
WORKDIR /tmp/zeromq-4.2.2
RUN ./configure
RUN make && make install
RUN ldconfig

WORKDIR /tmp
RUN wget https://boostorg.jfrog.io/artifactory/main/release/1.76.0/source/boost_1_76_0.tar.gz
RUN tar xfz boost_1_76_0.tar.gz
WORKDIR /tmp/boost_1_76_0
RUN ./bootstrap.sh --prefix=/usr/local --with-libraries=system --with-libraries=json
RUN ./b2 install

RUN git clone https://github.com/koykov/zmqbroker.git /opt/broker
WORKDIR /opt/broker

RUN ln -s shell/zeromq.sh run.sh

CMD /bin/bash run.sh
