#!/bin/bash -ex

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

centos/build.sh
ruby/build.sh
oss-emulator/build.sh
java/build.sh
