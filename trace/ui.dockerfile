FROM ubuntu:20.04

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:maxmind/ppa
RUN apt-get update --fix-missing
RUN apt-get install -y gcc curl openssl libtool pkg-config build-essential git npm nginx

RUN mv -f /var/www/html /var/www/html.bak

RUN git clone https://github.com/koykov/traceUI.git /opt/ui
RUN ln -s shell/ui.sh /opt/ui/run.sh
RUN ln -s config/ui.env /opt/ui/.env
WORKDIR /opt/ui
RUN mkdir dist

RUN ln -s /opt/ui/dist /var/www/html

CMD /bin/bash ./run.sh
