#!/bin/bash

PROFILE_DIR=/Users/jenkins/tmp/chrome-$RANDOM
LOG_FILE=/Users/jenkins/bin/chrome.log

cleanup() {
  killall "Google Chrome"
  rm -rf $PROFILE_DIR
}

# register a trap
trap "cleanup; exit 0" EXIT

# start
echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome \  --user-data-dir=$PROFILE_DIR \
  --disable-default-apps \
  --no-first-run \
  $1 \
  >> $LOG_FILE 2>&1

