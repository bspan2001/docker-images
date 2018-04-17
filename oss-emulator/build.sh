#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}
CACHE_DIR=${CACHE_DIR:-${DIR}/.cache}

source $DIR/../lib.sh

if [[ "$PULL_IMAGES" = "true" ]]; then
  # pull all tags of the docker image
  docker pull "${IMAGE_NAME}:latest" || true
fi

if [[ "$PULL_IMAGES_ONLY" != "true" ]]; then
  # build docker image with multiple tags
  docker build -t "${IMAGE_NAME}:latest" \
               --force-rm \
               "${DIR}/latest"

  if [[ "$ENABLE_CACHE" = "true" ]]; then
    # save docker image to cache dir
    mkdir -p ${CACHE_DIR}/szewec
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-latest.tar" "${IMAGE_NAME}:latest"
  fi
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  # push all tags of the docker image
  docker push "${IMAGE_NAME}:latest"
fi
