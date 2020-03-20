#!/bin/sh

set -e

DOCKERFILE_PATH=$1
DOCKER_FILE_TO_USE="/Dockerfile"

if [ -n "$DOCKERFILE_PATH" ]; then
  if [ -f $DOCKERFILE_PATH ] ; then
    DOCKER_FILE_TO_USE=$DOCKERFILE_PATH
  else
    echo "Imposible to find Dockerfile at path : $DOCKERFILE_PATH"
  fi
fi

docker build . -f $DOCKER_FILE_TO_USE -t native-build-image
id=$(docker create native-build-image)
docker cp $id:/usr/src/app/target/app-runner app-runner
