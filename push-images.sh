#!/bin/bash

for imagepath in $(cat ./imagepath.txt)
do
imagename=$(echo $imagepath | awk -F '/' '{print $NF}')
docker pull $imagepath

# push到私有仓库
docker tag $imagepath registry.cn-hangzhou.aliyuncs.com/k8mirror/$imagename
docker push registry.cn-hangzhou.aliyuncs.com/k8mirror/$imagename

# push到dockerhub
docker tag $imagepath 599680041/$imagename
docker push 599680041/$imagename
done
