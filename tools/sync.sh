#!/bin/bash
#
# sync.sh - sync the submodules
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

pushd ${TOP_DIR}
git submodule update --init --remote vnc2swf
git submodule update --init --remote vplayer
git submodule update --init --remote vtools
git submodule update --init --remote recordings/default
git submodule update --init --remote cloud-ubuntu
popd
