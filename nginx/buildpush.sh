#!/bin/bash
#Build the docker image from the Dockerfile
docker build -t nginx .

####test image
docker run -p 80:80 nginx

#Tag the image with the current version and the latest tag
docker tag nginx {account-id}.dkr.ecr.ap-southeast-2.amazonaws.com/nginx:latest

#Retrieve the docker login command with authentication from AWS, and then execute
$(aws ecr get-login --region ap-southeast-2 --no-include-email)

#Push the imnages to the remote repository
docker push {account-id}.dkr.ecr.ap-southeast-2.amazonaws.com/nginx:latest
