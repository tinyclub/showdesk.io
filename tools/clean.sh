#!/bin/bash

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

find ${TOP_DIR} -name "*.novnc*" -exec rm -rf {} \;
find ${TOP_DIR} -name "*.vnc*" -exec rm -rf {} \;
