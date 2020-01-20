  
FROM debian:stretch


RUN  apt install -y   git \
	  python3-dev libncurses5-dev libxml2-dev \
	  libedit-dev swig doxygen graphviz xz-utils ninja-build

# Clang 8 as a compiler
RUN apt-get update && apt-get install -y \
  xz-utils \
  build-essential \
  curl \
  && rm -rf /var/lib/apt/lists/* \
  && curl -SL http://releases.llvm.org/8.0.0/clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04.tar.xz \
  | tar -xJC . && \
  mv clang+llvm-8.0.0-x86_64-linux-gnu-ubuntu-18.04 clang_8.0.0 && \
  echo 'export PATH=/clang_8.0.0/bin:$PATH' >> ~/.bashrc && \
  echo 'export LD_LIBRARY_PATH=/clang_8.0.0/lib:LD_LIBRARY_PATH' >> ~/.bashrc

#
RUN apt-get update
#install sdkman 
RUN rm /bin/sh && ln -s /bin/bash /bin/sh
RUN apt-get -qq -y install curl wget unzip zip
RUN curl -s "https://get.sdkman.io" | bash
RUN source "$HOME/.sdkman/bin/sdkman-init.sh"

#install gradle
RUN yes | /bin/bash -l -c 'sdk install gradle 6.1'
