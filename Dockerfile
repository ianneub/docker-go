FROM ubuntu:14.04
MAINTAINER Ian Neubert <ian@ianneubert.com>

### Update system
RUN apt-get update && apt-get -y upgrade
RUN apt-get install -y wget ca-certificates build-essential git mercurial bzr

ENV PATH $PATH:/usr/local/go/bin
ENV GOPATH /usr/local/go/

RUN wget --no-verbose http://golang.org/dl/go1.3.src.tar.gz
RUN tar -v -C /usr/local -xzf go1.3.src.tar.gz
RUN cd /usr/local/go/src && ./make.bash --no-clean 2>&1

WORKDIR /app
