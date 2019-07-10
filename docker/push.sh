#!/bin/bash -e

prefix="docker-bamboo-repo.sberned.ru/load"

docker push "$prefix/jmeter-base:latest"
docker push "$prefix/jmeter-master:latest"
docker push "$prefix/jmeter-slave:latest"
#docker build "kubernautslabs/jmeter-reporter"
