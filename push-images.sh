#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到私有仓库
docker tag $imagepath 114.115.138.52/admin/$imagename
docker push 114.115.138.52/admin/$imagename

# push到dockerhub
docker tag $imagepath 599680041/$imagename
docker push 599680041/$imagename
done
