#!/bin/sh

set -e

DOCKERFILE_PATH=$1
DOCKER_FILE_TO_USE="/Dockerfile"

if [ ! -z $DOCKERFILE_PATH  &&  -f $DOCKERFILE_PATH ]; then
  echo "Impossible to find the Dockerfile at $DOCKERFILE_PATH"
  exit 1
else
  echo "dockerfilePafined and exits"
  echo $DOCKERFILE_PATH
  DOCKER_FILE_TO_USE=$DOCKERFILE_PATH
fi

docker build . -f $DOCKER_FILE_TO_USE -t native-build-image
id=$(docker create native-build-image)
docker cp $id:/usr/src/app/target/app-runner app-runner
