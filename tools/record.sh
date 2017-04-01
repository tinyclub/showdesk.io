#!/bin/bash

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

[ -z "$DATA_REPO" ] && DATA_REPO=default

# Record
OUTTYPE=novnc RECORDINGS=${TOP_DIR}/recordings/${DATA_REPO} ${TOP_DIR}/vnc2swf/tools/record.sh

# Publish
${TOP_DIR}/tools/publish.sh
