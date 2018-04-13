#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t "szewec/centos:7.3.1611" -t "szewec/centos:latest" --force-rm "$DIR/7.3.1611"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "szewec/centos:7.3.1611"
  docker push "szewec/centos:latest"
fi
