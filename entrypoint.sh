#!/bin/sh

set -e

docker build . -f /Dockerfile.buildNativeApp -t native-build-image
id=$(docker create native-build-image)
docker cp $id:/usr/src/app/target/app-runner app-runner
