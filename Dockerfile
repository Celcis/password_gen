  
FROM debian:stretch


FROM debian:stretch-slim as llvm-stage

RUN apt-get update \
    && apt-get install -y curl xz-utils

RUN cd /tmp/ \
    && curl http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz -# -o llvm.tar.xz \
    && mkdir llvm-prebuilt/ && tar xf ./llvm.tar.xz -C llvm-prebuilt --strip-components=1


RUN apt-get update \
    && apt-get install -y git clang python3

RUN mkdir -p /tmp/ && cd /tmp/ \
    && git clone https://github.com/ninja-build/ninja.git --branch="v1.9.0" \
    && cd /tmp/ninja/ \
    && CXX=clang++ ./configure.py --bootstrap

#
RUN apt-get update
#install sdkman 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zi
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

#install gradle
RUN yes | /bin/bash -l -c 'sdk install gradle 6.1'
