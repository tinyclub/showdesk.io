#!/bin/bash
#
# play.sh -- play the novnc session with VPlayer
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

DEF_BROWSER=firefox
which chromium-browser >/dev/null 2>&1 && DEF_BROWSER=chromium-browser
[ -z "$WEB_BROWSER" ] && WEB_BROWSER=$DEF_BROWSER

$WEB_BROWSER ${TOP_DIR}/play.html
