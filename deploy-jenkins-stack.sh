#!/bin/sh

DATE=$(date -I)

docker build . --no-cache -t b96wang/jenkins:$DATE
docker tag b96wang/jenkins:$DATE b96wang/jenkins:lts 
docker tag b96wang/jenkins:$DATE b96wang/jenkins:latest

docker push b96wang/jenkins:$DATE
docker push b96wang/jenkins:latest
docker push b96wang/jenkins:lts

docker stack rm jenkins
sleep 15

docker stack deploy -c docker-compose.yml jenkins
