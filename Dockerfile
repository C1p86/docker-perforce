FROM ubuntu:18.04

RUN apt-get update -y
RUN apt-get -y install gnupg2 curl
RUN echo 'deb http://package.perforce.com/apt/ubuntu bionic release' | tee -a /etc/apt/sources.list.d/perforce.list
RUN curl -fsSL http://package.perforce.com/perforce.pubkey | apt-key add -
RUN apt-get update
RUN apt-get -y install helix-p4d
