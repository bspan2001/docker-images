#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t "szewec/ruby:latest" --force-rm "$DIR/latest"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "szewec/ruby:latest"
fi
