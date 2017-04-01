#!/bin/bash
#
# install.sh -- install record/play shortcuts to Desktop
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

NOVNC_RECORD=${TOP_DIR}/tools/record.sh
NOVNC_PLAY=${TOP_DIR}/tools/play.sh
NOVNC_RECORD_ICON=${TOP_DIR}/vnc2swf/icons/recorder.png
NOVNC_PLAY_ICON=${TOP_DIR}/vnc2swf/icons/player.png
NOVNC_SYNC=${TOP_DIR}/tools/sync.sh

echo "LOG: Pull noVNC recorder(pyvnc2swf), player(vplayer), tools(vtools) and data(recordings)"
$NOVNC_SYNC

echo "LOG: Install desktop shortcuts"

cat <<EOF > ~/Desktop/vnc-record.desktop
[Desktop Entry]
Encoding=UTF-8
Name=noVNC REC
Comment=Record the VNC Session with noVNC output
Exec=$NOVNC_RECORD
Icon=$NOVNC_RECORD_ICON
Type=Application
EOF

cat <<EOF > ~/Desktop/vnc-play.desktop
[Desktop Entry]
Encoding=UTF-8
Name=noVNC Player
Comment=Play the just recorded VNC session
Exec=$NOVNC_PLAY
Icon=$NOVNC_PLAY_ICON
Type=Application
EOF
