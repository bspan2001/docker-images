#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

docker pull "${IMAGE_NAME}:latest" || true

docker build -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/latest"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:latest"
fi
