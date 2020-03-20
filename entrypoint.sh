#!/bin/sh

set -e
pwd
ls -la
ls -la /github/workspace
docker build . -f /Dockerfile -t native-build-image
id=$(docker create native-build-image)
docker cp $id:/usr/src/app/target/app-runner app-runner
