#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
IMAGE_NAME=szewec/${DIR##*/}

PUSH_IMAGES=${PUSH_IMAGES:-false}
PULL_ONLY=${PULL_ONLY:-false}

for i in "$@"
do
  case $i in
    --push-images)
      PUSH_IMAGES="true"
      shift
    ;;
    --pull-only)
      PULL_ONLY="true"
      shift
    ;;
    --help)
      echo "$0 [--push-images | --pull-only]"
      echo "--push-images    push images to docker hub after build"
      echo "--pull-only      only pull images from docker hub, donnot build images"
      exit 0
    ;;
  esac
done

docker pull "${IMAGE_NAME}:openjdk-8" || true
docker pull "${IMAGE_NAME}:8" || true
docker pull "${IMAGE_NAME}:latest" || true
# docker pull "${IMAGE_NAME}:openjdk-8-libreoffice5.3" || true
# docker pull "${IMAGE_NAME}:8-libreoffice5.3" || true
# docker pull "${IMAGE_NAME}:openjdk-8-openoffice4" || true
# docker pull "${IMAGE_NAME}:8-openoffice4" || true

if [[ "$PULL_ONLY" != "true" ]]; then
  docker build -t "${IMAGE_NAME}:openjdk-8" \
               -t "${IMAGE_NAME}:8" \
               -t "${IMAGE_NAME}:latest" \
               --force-rm \
               "${DIR}/openjdk-8"
  # docker build -t "${IMAGE_NAME}:openjdk-8-libreoffice5.3" \
  #              -t "${IMAGE_NAME}:8-libreoffice5.3" \
  #              --force-rm \
  #              "${DIR}/openjdk-8-libreoffice5.3"
  # docker build -t "${IMAGE_NAME}:openjdk-8-openoffice4" \
  #              -t "${IMAGE_NAME}:8-openoffice4" \
  #              --force-rm \
  #              "${DIR}/openjdk-8-openoffice4"
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:openjdk-8"
  docker push "${IMAGE_NAME}:8"
  docker push "${IMAGE_NAME}:latest"
  # docker push "${IMAGE_NAME}:openjdk-8-libreoffice5.3"
  # docker push "${IMAGE_NAME}:8-libreoffice5.3"
  # docker push "${IMAGE_NAME}:openjdk-8-openoffice4"
  # docker push "${IMAGE_NAME}:8-openoffice4"
fi
