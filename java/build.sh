#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

docker build -t "${IMAGE_NAME}:openjdk-8" -t "${IMAGE_NAME}:8" -t "${IMAGE_NAME}:latest" --force-rm "${DIR}/openjdk-8"
docker build -t "${IMAGE_NAME}:openjdk-8-libreoffice5.3" -t "${IMAGE_NAME}:8-libreoffice5.3" --force-rm "${DIR}/openjdk-8-libreoffice5.3"
docker build -t "${IMAGE_NAME}:openjdk-8-openoffice4" -t "${IMAGE_NAME}:8-openoffice4" --force-rm "${DIR}/openjdk-8-openoffice4"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:openjdk-8"
  docker push "${IMAGE_NAME}:8"
  docker push "${IMAGE_NAME}:latest"
  docker push "${IMAGE_NAME}:openjdk-8-libreoffice5.3"
  docker push "${IMAGE_NAME}:8-libreoffice5.3"
  docker push "${IMAGE_NAME}:openjdk-8-openoffice4"
  docker push "${IMAGE_NAME}:8-openoffice4"
fi
