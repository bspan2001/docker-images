#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}
CACHE_DIR=${CACHE_DIR:-${DIR}/.cache}

source $DIR/../lib.sh

if [[ "$PULL_IMAGES" = "true" ]]; then
  # pull all tags of the docker image
  docker pull "${IMAGE_NAME}:openjdk-7" || true
  docker pull "${IMAGE_NAME}:7" || true
  docker pull "${IMAGE_NAME}:openjdk-8" || true
  docker pull "${IMAGE_NAME}:8" || true
  docker pull "${IMAGE_NAME}:latest" || true
  # docker pull "${IMAGE_NAME}:openjdk-8-libreoffice5.3" || true
  # docker pull "${IMAGE_NAME}:8-libreoffice5.3" || true
  # docker pull "${IMAGE_NAME}:openjdk-8-openoffice4" || true
  # docker pull "${IMAGE_NAME}:8-openoffice4" || true
fi

if [[ "$PULL_IMAGES_ONLY" != "true" ]]; then
  # build docker image with multiple tags
  docker build -t "${IMAGE_NAME}:openjdk-7" -t "${IMAGE_NAME}:7" --force-rm "${DIR}/openjdk-7"
  docker build -t "${IMAGE_NAME}:openjdk-8" -t "${IMAGE_NAME}:8" -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/openjdk-8"
  # docker build -t "${IMAGE_NAME}:openjdk-8-libreoffice5.3" -t "${IMAGE_NAME}:8-libreoffice5.3" --force-rm "${DIR}/openjdk-8-libreoffice5.3"
  # docker build -t "${IMAGE_NAME}:openjdk-8-openoffice4" -t "${IMAGE_NAME}:8-openoffice4" --force-rm "${DIR}/openjdk-8-openoffice4"

  if [[ "$ENABLE_CACHE" = "true" ]]; then
    # save docker image to cache dir
    mkdir -p ${CACHE_DIR}/szewec
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-openjdk-7.tar" "${IMAGE_NAME}:openjdk-7"
    docker save -o "${CACHE_DIR}/${IMAGE_NAME}-openjdk-8.tar" "${IMAGE_NAME}:openjdk-8"
    # docker save -o "${CACHE_DIR}/${IMAGE_NAME}-openjdk-8-libreoffice5.3.tar" "${IMAGE_NAME}:openjdk-8-libreoffice5.3"
    # docker save -o "${CACHE_DIR}/${IMAGE_NAME}-openjdk-8-openoffice4.tar" "${IMAGE_NAME}:openjdk-8-openoffice4"
  fi
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  # push all tags of the docker image
  docker push "${IMAGE_NAME}:openjdk-7"
  docker push "${IMAGE_NAME}:7"
  docker push "${IMAGE_NAME}:openjdk-8"
  docker push "${IMAGE_NAME}:8"
  docker push "${IMAGE_NAME}:latest"
  # docker push "${IMAGE_NAME}:openjdk-8-libreoffice5.3"
  # docker push "${IMAGE_NAME}:8-libreoffice5.3"
  # docker push "${IMAGE_NAME}:openjdk-8-openoffice4"
  # docker push "${IMAGE_NAME}:8-openoffice4"
fi
