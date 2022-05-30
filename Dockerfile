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

## We specify the base image we need for our
## go application
FROM golang:1.12.0-alpine3.9
## We create an /app directory within our
## image that will hold our application source
## files
RUN mkdir /app
## We copy everything in the root directory
## into our /app directory
ADD . /app
## We specify that we now wish to execute 
## any further commands inside our /app
## directory
WORKDIR /app
## we run go build to compile the binary
## executable of our Go program
RUN go build -o main .
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]

FROM golang:1.12.0-alpine3.9
RUN mkdir /app
ADD . /app
WORKDIR /app
## Add this go mod download command to pull in any dependencies
RUN go mod download
## Our project will now successfully build with the necessary go libraries included.
RUN go build -o main .
## Our start command which kicks off
## our newly created binary executable
CMD ["/app/main"]
