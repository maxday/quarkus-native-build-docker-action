#!/bin/sh

set -e

OUTPUT_NAME=$1
DOCKERFILE_PATH=$2
DOCKER_FILE_TO_USE="/Dockerfile"

if [ -z $OUTPUT_NAME ]; then
  echo '<outputName> parameter is missing'
  exit 1
fi

if [ -n "$DOCKERFILE_PATH" ]; then
  if [ -f $DOCKERFILE_PATH ] ; then
    echo "Dockerfile found"
    DOCKER_FILE_TO_USE=$DOCKERFILE_PATH
  else
    echo "Imposible to find Dockerfile at path : $DOCKERFILE_PATH"
    exit 1
  fi
fi

docker build . -f $DOCKER_FILE_TO_USE -t native-build-image

RUNNER_NAME=$(docker run native-build-image ls /usr/src/app/target | grep .-runner)
ID=$(docker create native-build-image)

docker cp $ID:/usr/src/app/target/$RUNNER_NAME $OUTPUT_NAME
