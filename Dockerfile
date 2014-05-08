FROM ubuntu:12.04
MAINTAINER Ian Neubert <ian@ianneubert.com>

### Update system
RUN apt-get update
RUN apt-get install -y wget ca-certificates build-essential git mercurial bzr

ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /usr/local/go/

RUN wget --no-verbose https://storage.googleapis.com/golang/go1.2.2.src.tar.gz
RUN tar -v -C /usr/local -xzf go1.2.2.src.tar.gz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1

WORKDIR /app
