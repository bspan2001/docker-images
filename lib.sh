#
# author: wangxiang3
# created: 2018-4-17
#
# desc:
#   internal script, include this file to your build.sh file,
#   parse args from ENV and cmd args
# e.g.
#   source lib.sh
#

ENABLE_CACHE=${PULL_IMAGES:-false}
PULL_IMAGES=${PULL_IMAGES:-false}
PULL_IMAGES_ONLY=${PULL_IMAGES_ONLY:-false}
PUSH_IMAGES=${PUSH_IMAGES:-false}

for i in "$@"
do
  case $i in
    --enable-cache)
      ENABLE_CACHE="true"
      shift
    ;;
    --pull-image)
      PULL_IMAGES="true"
      shift
    ;;
    --pull-image-only)
      PULL_IMAGES="true"
      PULL_IMAGES_ONLY="true"
      shift
    ;;
    --push-images)
      PUSH_IMAGES="true"
      shift
    ;;
    --help)
      echo "$0 [--push-images | --pull-only]"
      echo "--push-images      push images to docker hub after build"
      echo "--pull-image       pull images from docker hub before build images"
      echo "--pull-image-only  only pull images from docker hub, donnot build images"
      exit 0
    ;;
  esac
done
