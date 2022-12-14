FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
 && apt-get -y install --no-install-recommends build-essential \
    git ca-certificates openssl libssl-dev wget \
 && apt-get clean

WORKDIR /builds
RUN git clone https://github.com/Kitware/CMake.git -b v3.24.3 \
 && cd CMake && ./configure --prefix=/usr/local && make && make install \
 && make clean && cd .. && rm -rf CMake

