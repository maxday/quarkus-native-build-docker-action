FROM docker:stable

RUN apk update \
  && apk upgrade \
  && apk add --no-cache git bash

COPY Dockerfile.buildNativeApp /Dockerfile.buildNativeApp 
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]