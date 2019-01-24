FROM ubuntu:18.04 AS build
RUN mkdir /cmake
WORKDIR /cmake
COPY . /cmake
RUN apt-get update -qq && \
    apt-get install -qq \
    build-essential \
    glibc-source \
    linux-libc-dev \
    libcurl4 \
    gcc \
    g++ \
    make && \
    apt-get clean
RUN ./bootstrap
RUN make 
RUN make install
CMD [ "cmake", "--help" ]