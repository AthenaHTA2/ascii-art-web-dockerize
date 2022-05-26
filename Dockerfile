#syntax=docker/dockerfile:1

FROM golang:1.17.1-alpine

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go get ascii-art-web-dockerize/main
RUN cd /build && git clone https://learn.01founders.co/git/Nathan/ascii-art-web-dockerize.git

RUN cd /ascii-art-web-dockerize && go build

EXPOSE 8080

ENTRYPOINT [ "/build/ascii-art-web-dockerize/main"]
