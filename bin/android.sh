#!/bin/bash

VMNAME="Android"
LOG_FILE="/Users/jenkins/bin/android.log"

androidExec() {
  # unlock phone
  adb shell input keyevent 82

  # start browser
  adb shell am start -a android.intent.action.VIEW -n com.android.browser/.BrowserActivity -d "$1"

  # block until trap
  cat
}


killAndroid() {
  adb shell am force-stop com.android.browser
}

trap "killAndroid; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE

captureUrl=$1
androidExec ${captureUrl/localhost/192.168.1.104}
