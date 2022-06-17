#Nathan: error during connect: This error may indicate that the docker daemon is not running.: 
#Post "http://%2F%2F.%2Fpipe%2Fdocker_engine/v1.24/build?buildargs=%7B%7D&cachefrom=%5B%5D&cgroupparent=&cpuperiod=0&cpuquota=0&cpusetcpus=&cpusetmems=&cpushares=0&dockerfile=Dockerfile&labels=%7B%7D&memory=0&memswap=0&networkmode=default&rm=1&shmsize=0&t=asciiartwebdockerize&target=&ulimits=null&version=1": 
#open //./pipe/docker_engine: The system cannot find the file specified.

#Helena: below code works. In VSC type below two commands to build an image first, then a container:
#1) docker build -t asciidocker .
#2) docker container run -p 8080:8080 -d --name containerasciidocker asciidocker

#However, then typing 'localhost:8080' in the browser, we get the error: 'The connection was reset'
#Also, when running it locally from the VSC terminal by typing: go run main.go 
#we get an error message saying that there is a problem on line 71 which has 't.Execute(w, nil)'

#Troubleshooting
#If get error message: 'Got permission denied while trying to connect to the Docker daemon socket'
#Fix it by typing in VSC terminal: sudo chmod 777 /var/run/docker.sock 
#To see a list of all images type: docker image ls
#To see a list of all containers type: docker ps -a


FROM golang:1.17

RUN mkdir /build
ADD . /build
WORKDIR /build

COPY go.mod .

RUN go build -o main

#RUN export GO111MODULE=on
#RUN go get learn.01founders.co/git/Nathan/ascii-art-web-dockerize/main
#RUN cd /build && git clone https://learn.01founders.co/git/Nathan/ascii-art-web-dockerize.git

#RUN cd /build/ascii-art-web-dockerize/main && go build

EXPOSE 8080

ENTRYPOINT [ "/build/main"]