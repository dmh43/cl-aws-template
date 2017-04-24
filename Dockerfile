################################################################
# CL Runtime and Caveman WEB App
################################################################
# FROM debian:jessie-backports
# FROM debian:stretch
# MAINTAINER keicy-silurus
FROM debian:latest

################################################################
# Common Lisp
# Roswll でなく直に sbcl をaptでも良い気がするが、quicklispとかめんどいか
# まあCLはいずれ離れるだろうし、拘らないで良いと思う
# CL側の問題であってDocker起因ではないし

RUN apt-get update
RUN apt-get -y install git build-essential automake libcurl4-openssl-dev
RUN git clone -b release https://github.com/roswell/roswell.git
WORKDIR roswell
RUN ./bootstrap
RUN ./configure
RUN make
RUN make install
RUN ros setup
RUN ros install sbcl-bin

# RUN apt-get --purge autoremove
# RUN apt-get clean
# RUN rm -rf ~/roswell

################################################################
# App
EXPOSE 80
ENV APP_ENV production
WORKDIR /app
ADD . /app
RUN ./ros/up.ros

################################################################
# Uninstall tools
# RUN apt-get --purge autoremove git
