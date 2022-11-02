FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get -y update \
 && apt-get -y install --no-install-recommends build-essential g++ \
    gdb doxygen git openssh-client openssl libssl-dev wget vim sudo \
    python3 python3-dev python3-pip \
 && python3 -m pip install numpy cookiecutter sphinx breathe sphinx_rtd_theme

WORKDIR /builds
RUN git clone https://github.com/Kitware/CMake.git -b v3.24.3 \
 && cd CMake && ./configure --prefix=/usr && make && make install \
 && make clean && cd .. && rm -rf CMake

