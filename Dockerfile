
FROM golang:1.17

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go get learn.01founders.co/git/Nathan/ascii-art-web-dockerize/main
RUN cd /build && git clone https://learn.01founders.co/git/Nathan/ascii-art-web-dockerize.git

RUN cd /build/ascii-art-web-dockerize/main && go build

EXPOSE 8080

ENTRYPOINT [ "/build/ascii-art-web-dockerize/main/main"]