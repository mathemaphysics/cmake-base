FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
 && apt-get -y install --no-install-recommends build-essential \
    git ca-certificate openssl libssl-dev wget \
 && apt-get clean

WORKDIR /builds
RUN git clone https://github.com/Kitware/CMake.git -b v3.24.3 \
 && cd CMake && ./configure --prefix=/usr && make && make install \
 && make clean && cd .. && rm -rf CMake

