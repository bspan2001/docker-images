#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

docker push "${IMAGE_NAME}:2.0.0"
docker build -t "${IMAGE_NAME}:2.0.0" -t "${IMAGE_NAME}:2.0" -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/2.0.0"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:2.0.0"
  docker push "${IMAGE_NAME}:2.0"
  docker push "${IMAGE_NAME}:latest"
fi
