#!/bin/sh

set -e
TAG=$1

if [ -z $TAG ]; then
  echo '<tag> parameter is missing'
  exit 1
fi

chmod u+x native-executable/app-runner
docker build . -f /Dockerfile.dockerize -t $TAG

echo ::set-output name=image::$TAG