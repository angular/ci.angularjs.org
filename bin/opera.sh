#!/bin/bash

PROFILE_DIR=/Users/jenkins/tmp/opera-$RANDOM
LOG_FILE=/Users/jenkins/bin/opera.log

cleanup() {
  killall Opera
  rm -rf $PROFILE_DIR
}

# register a trap
trap "{ cleanup; exit 0; }" EXIT


# start
echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

/Applications/Opera.app/Contents/MacOS/Opera \
  -personaldir $PROFILE_DIR \
  -nomail \
  $1 \
  >> $LOG_FILE 2>&1
