#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

source $DIR/../lib.sh

if [[ "$PULL_IMAGES" = "true" ]]; then
  docker pull "${IMAGE_NAME}:2.0.0" || true
  docker pull "${IMAGE_NAME}:2.0" || true
  docker pull "${IMAGE_NAME}:latest" || true
fi

if [[ "$PULL_IMAGES_ONLY" != "true" ]]; then
  docker build -t "${IMAGE_NAME}:2.0.0" \
               -t "${IMAGE_NAME}:2.0" \
               -t "${IMAGE_NAME}:latest" \
               --force-rm \
               "${DIR}/2.0.0"
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:2.0.0"
  docker push "${IMAGE_NAME}:2.0"
  docker push "${IMAGE_NAME}:latest"
fi
