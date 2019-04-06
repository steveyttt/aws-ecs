#!/bin/bash
#Build the docker image from the Dockerfile
docker build -t squid .

####test image and hit a URL
docker run -p 3128:3128 squid
curl www.google.com -x http://localhost:3128

#Tag the image with the current version and the latest tag
docker tag squid {account-id}.dkr.ecr.ap-southeast-2.amazonaws.com/squid:latest

#Retrieve the docker login command with authentication from AWS, and then execute
$(aws ecr get-login --region ap-southeast-2 --no-include-email)

#Push the imnages to the remote repository
docker push {account-id}.dkr.ecr.ap-southeast-2.amazonaws.com/squid:latest
