#!/bin/bash
#
# rename.sh - rename the session files from x to y
#
# Usage: ./rename.sh linux-0.11-lab linux-0.11-lab-usage
#

TOP_DIR=$(cd $(dirname $0)/../ && pwd)/

from=$1
to=$2

[ -z "$from" -o -z "$to" ] && echo "Usage: $0 from to" && exit 1
[ -z "$DATA_REPO" ] && DATA_REPO=default

RECORDINGS=${TOP_DIR}/recordings/${DATA_REPO}

pushd ${TOP_DIR}

for f in `find $RECORDINGS -type f -name "*$from*" | sed -e "s%${TOP_DIR}/%%g"`
do
   t=`echo $f | sed -e "s/$from/$to/g"`

   mv $f $t
done

popd
