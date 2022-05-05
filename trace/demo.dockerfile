FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:maxmind/ppa
RUN apt-get update --fix-missing
RUN apt-get install -y gcc curl openssl libtool pkg-config build-essential autoconf automake cmake wget git

WORKDIR /tmp
RUN wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz
RUN tar -xvf go1.16.5.linux-amd64.tar.gz && mv go /usr/lib/golang
ENV GOROOT /usr/lib/golang
ENV GOBIN /usr/lib/golang/bin
ENV GOPATH /var/www
ENV PATH /usr/lib/golang/bin:$PATH

WORKDIR /tmp
RUN wget https://github.com/zeromq/libzmq/releases/download/v4.2.2/zeromq-4.2.2.tar.gz
RUN tar xvzf zeromq-4.2.2.tar.gz
WORKDIR /tmp/zeromq-4.2.2
RUN ./configure && make && make install && ldconfig

RUN git clone https://github.com/koykov/demo.git /opt/demo
RUN ln -s shell/demo.sh /opt/demo/traceID/run.sh
WORKDIR /opt/demo/traceID
RUN ls -l

CMD /bin/bash ./run.sh
