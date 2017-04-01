#!/bin/bash
#
# publish.sh - Publish noVNC sessions
#
# Usage: publish.sh $PWD/recordings/ 0|1|2|3 $PWD/
#
#	 0: action = ('remove_raw', 'zb64', 'slice')
#	 1: action = ('remove', 'remove_raw')
#	 2: action = ('restore_raw')
#	 3: action = ('remove_raw', 'zb64', 'slice', 'md')
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/
VRECORDS=${TOP_DIR}/vtools/wrapper.py

VNC_RECORD_DIR=$1
VNC_RECORD_ACTION=$2
VNC_WWW_DIR=$3

[ -z "$VNC_RECORD_ACTION" ] && VNC_RECORD_ACTION=3
[ -z "$VNC_RECORD_DIR" ] && VNC_RECORD_DIR=${TOP_DIR}/recordings/
[ -z "$VNC_WWW_DIR" ] && VNC_WWW_DIR=${TOP_DIR}/
[ -z "$VNC_POST_DIR" ] && VNC_POST_DIR=${TOP_DIR}/_posts/
[ -z "$VNC_SESSION_DIR" ] && VNC_SESSION_DIR=${TOP_DIR}/sessions/

${VRECORDS} $VNC_RECORD_DIR $VNC_RECORD_ACTION $VNC_WWW_DIR

# Public sessions
find $VNC_RECORD_DIR -name "*.session.md" | xargs -i mv {} $VNC_SESSION_DIR

# Public posts
find $VNC_RECORD_DIR -name "*.post.md" | xargs -i mv {} $VNC_POST_DIR
