#!/bin/bash
set -o errexit -o nounset -o xtrace
ORG=hsldevcom
DOCKER_IMAGE=digitransit-proxy

# Set these environment variables
#DOCKER_TAG=
#DOCKER_EMAIL=
#DOCKER_USER=
#DOCKER_AUTH=

# Build image
docker build --tag="$ORG/$DOCKER_IMAGE:$DOCKER_TAG" .
docker login -e $DOCKER_EMAIL -u $DOCKER_USER -p $DOCKER_AUTH
docker push $ORG/$DOCKER_IMAGE:$DOCKER_TAG
docker tag  $ORG/$DOCKER_IMAGE:$DOCKER_TAG $ORG/$DOCKER_IMAGE:latest
docker push $ORG/$DOCKER_IMAGE:latest
