#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

docker build -t "${IMAGE_NAME}:7.3.1611" -t "${IMAGE_NAME}:7.3" -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/7.3.1611"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:7.3.1611"
  docker push "${IMAGE_NAME}:7.3"
  docker push "${IMAGE_NAME}:latest"
fi
