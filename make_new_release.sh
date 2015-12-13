#!/usr/bin/env bash

DOCKER_IMAGE_NAME="$USER/bootstrap-slider-rails"
LIBRARY_NEW_VERSION=`cat lib/**/*.rb | grep VERSION | awk '{ print $3 }' | tr -d "'"`

echo "Ensuring Docker image $DOCKER_IMAGE_NAME exists ..."
EXISTING_DOCKER_IMAGE=`docker images | grep "$DOCKER_IMAGE_NAME"`
if [[ -z "$EXISTING_DOCKER_IMAGE" ]]; then
  echo "Building the Docker image ..."
  docker build -t "$DOCKER_IMAGE_NAME" .
fi

echo "Updating library code to version $LIBRARY_NEW_VERSION ..."
docker run --rm -v `pwd`:/gem/ "$DOCKER_IMAGE_NAME" rake update

LIBRARY_UPDATED=`git status --porcelain`
if [[ -z "$LIBRARY_UPDATED" ]]; then
  echo "No update found, stopping release creation."
  exit 1
fi

echo "Committing new version ..."
git commit -m "Import version $LIBRARY_NEW_VERSION"

echo "Releasing gem ..."
docker run --rm -v ~/.gitconfig:/root/.gitconfig \
  -v ~/.ssh/:/root/.ssh/ \
  -v ~/.gem/:/root/.gem/ \
  -v `pwd`:/gem/ "$DOCKER_IMAGE_NAME" rake release
