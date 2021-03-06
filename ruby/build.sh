#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}
CACHE_DIR=${CACHE_DIR:-${DIR}/.cache}

source $DIR/../lib.sh

if [[ "$PULL_IMAGES" = "true" ]]; then
  # pull all tags of the docker image
  docker pull "${IMAGE_NAME}:2.2" || true
  docker pull "${IMAGE_NAME}:2.3" || true
  docker pull "${IMAGE_NAME}:2.4" || true
  docker pull "${IMAGE_NAME}:latest" || true
fi

if [[ "$PULL_IMAGES_ONLY" != "true" ]]; then
  # build docker image with multiple tags
  docker build -t "${IMAGE_NAME}:2.2" --force-rm "${DIR}/2.2"
  docker build -t "${IMAGE_NAME}:2.3" --force-rm "${DIR}/2.3"
  docker build -t "${IMAGE_NAME}:2.4" -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/2.4"

  if [[ "$ENABLE_CACHE" = "true" ]]; then
    # save docker image to cache dir
    mkdir -p ${CACHE_DIR}/szewec
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-2.2.tar" "${IMAGE_NAME}:2.2"
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-2.3.tar" "${IMAGE_NAME}:2.3"
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-2.4.tar" "${IMAGE_NAME}:2.4"
  fi
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  # push all tags of the docker image
  docker push "${IMAGE_NAME}:2.2"
  docker push "${IMAGE_NAME}:2.3"
  docker push "${IMAGE_NAME}:2.4"
  docker push "${IMAGE_NAME}:latest"
fi
