#!/bin/bash

PROFILE_DIR=/Users/jenkins/tmp/chrome-canary-$RANDOM
LOG_FILE=/Users/jenkins/bin/chrome-canary.log

cleanup() {
  killall "Google Chrome Canary"
  rm -rf $PROFILE_DIR
}

# register a trap
trap "cleanup; exit 0" EXIT

# start
echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary \  --user-data-dir=$PROFILE_DIR \
  --disable-default-apps \
  --no-first-run \
  $1 \
  >> $LOG_FILE 2>&1

