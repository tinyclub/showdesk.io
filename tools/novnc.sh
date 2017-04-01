#!/bin/bash
#
# novnc.sh - novnc recorder: vnc web client
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

[ -z "$DATA_REPO" ] && DATA_REPO=default

LAB_SECURITY=0 \
	VNC_MOUNT=1 VNC_RECORD=0 \
	GATEONE_PUBLIC=1 GATEONE_AUTH="none" \
	VNC_AUTH='' VNC_PUBLIC=1 LOCAL_VNC_PORT=6080 \
	UNIX_PWD=`pwgen -c -n -s -1 25` ENCRYPT_CMD=md5sum \
        VNC_RECORDINGS=${TOP_DIR}/recordings/${DATA_REPO} \
	${TOP_DIR}/cloud-ubuntu/scripts/web-ubuntu.sh

echo "LOG: http://localhost:6080/vnc.html"
