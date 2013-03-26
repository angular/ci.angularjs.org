#!/bin/bash

VMNAME="Android"
LOG_FILE="/Users/jenkins/bin/android.log"

source ~/.bashrc

androidExec() {
  # ensure that the phone is unlocked
  adb shell input keyevent 82 >> $LOG_FILE

  # clear data so open tabs don't persist
  adb shell pm clear com.android.browser

  # start browser
  adb shell am start -a android.intent.action.VIEW -n com.android.browser/.BrowserActivity -d "$1"

  # block until trap
  cat
}


killAndroid() {
  # stop the browser
  adb shell am force-stop com.android.browser
}

trap "killAndroid; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE


# http://developer.android.com/tools/devices/emulator.html#emulatornetworking
captureUrl=$1
androidExec ${captureUrl/localhost/10.0.2.2}
