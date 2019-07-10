#!/bin/bash -e

prefix="docker-bamboo-repo.sberned.ru/load"

docker build --tag="$prefix/jmeter-base:latest" -f Dockerfile-base .
docker build --tag="$prefix/jmeter-master:latest" -f Dockerfile-master .
docker build --tag="$prefix/jmeter-slave:latest" -f Dockerfile-slave .
#docker build --tag="kubernautslabs/jmeter-reporter" -f Dockerfile-reporter .
