## Description :
Ascii-art-web-dockerize is a containerized application that runs in an isolated runtime environment called container.

## Authors :
Helena -    username : AthenaHTA <br>
Nathan -    username : Nathan<br>
-  username : Kingyam <br>


## Implementation details :

For this project we created:

    one Dockerfile
    one image
    one container

This application runs from within the Docker container, rather than from a virtual machine or a physical server


## Usage
To build a new image, in the VSC terminal type: docker build -t dockertestone . 
To build a new container, type: docker container run -p 8080:8080 -d --name containerdockertestone dockertestone
To view all images on the computer: docker image ls
To view all containers on the computer: docker ps -a
To run the application in the container: docker exec -it containerdockertestone /bin/bash
To view the processes/file system, type:  ls -l
To clear unused resources type: docker system prune -a
To exit Docker type: exit
At this stage you access explorer and type: localhost:8080


## To Run Dockerize Through the 'script.sh' Shell File
In VSC terminal type: bash script.sh or ./script.sh
After a few seconds, type 'y' in the terminal


