#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

docker build -t "szewec/ruby:2.0.0" -t "szewec/ruby:latest" --force-rm "$DIR/2.0.0"

if [[ "$PUSH_IMAGES" = "true" ]]; then
  docker push "szewec/ruby:2.0.0"
  docker push "szewec/ruby:latest"
fi
