#error during connect: This error may indicate that the docker daemon is not running.: 
#Post "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&shmsize=0&t=asciiartwebdockerize&target=&ulimits=null&version=1": 
#open //./pipe/docker_engine: The system cannot find the file specified.

FROM golang:1.17

RUN mkdir /build
WORKDIR /build

RUN export GO111MODULE=on
RUN go get learn.01founders.co/git/Nathan/ascii-art-web-dockerize/main
RUN cd /build && git clone https://learn.01founders.co/git/Nathan/ascii-art-web-dockerize.git

RUN cd /build/ascii-art-web-dockerize/main && go build

EXPOSE 8080

ENTRYPOINT [ "/build/ascii-art-web-dockerize/main/main"]