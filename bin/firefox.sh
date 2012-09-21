#!/bin/bash

PROFILE_DIR=/Users/jenkins/tmp/firefox-$RANDOM
LOG_FILE=/Users/jenkins/bin/firefox.log

cleanup() {
  killall "firefox"
  rm -rf $PROFILE_DIR
}

# register a trap
trap "cleanup; exit 0" EXIT


# start
echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

/Applications/Firefox.app/Contents/MacOS/firefox -CreateProfile "test $PROFILE_DIR"

/Applications/Firefox.app/Contents/MacOS/firefox \
  -profile $PROFILE_DIR \
  $1 \
  >> $LOG_FILE 2>&1

