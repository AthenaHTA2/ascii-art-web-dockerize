#!/bin/sh
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker system prune -a
docker y
docker build -t dockertesttwo . 
docker container run -p 8080:8080 -d --name containerdockertesttwo dockertesttwo
docker image ls
docker ps -a
docker exec -it containerdockertesttwo /bin/bash
ls -l
#exit