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

docker pull "${IMAGE_NAME}:latest" || true

if [[ "$PULL_ONLY" != "true" ]]; then
  docker build -t "${IMAGE_NAME}:latest" \
               --force-rm \
               "${DIR}/latest"
fi

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "${IMAGE_NAME}:latest"
fi
