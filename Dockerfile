FROM alpine:3.16.2
MAINTAINER Sergio C <scarrascoh.develop@gmail.com>

RUN apk add --update --no-cache git gcc g++ make perl openssl openssl-dev nss-dev

WORKDIR /opt

RUN git clone https://github.com/magnumripper/JohnTheRipper.git

WORKDIR /opt/JohnTheRipper/src

RUN ./configure && make clean && make -s

WORKDIR /opt/JohnTheRipper/run

ENTRYPOINT ["./john"]
