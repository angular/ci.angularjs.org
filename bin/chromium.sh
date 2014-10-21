#!/bin/bash

LOG_FILE="/Users/jenkins/bin/android_chromium.log"

source ~/.bashrc

chromiumExec() {
  adb shell input keyevent 82 >> $LOG_FILE

  # start browser
  adb shell am start \
    -a android.intent.action.MAIN \
    -n com.google.android.apps.chrome/.Main \
    -c android.intent.category.LAUNCHER \
    -d "$1"

  # block until trap
  cat
}


killChromium() {
  adb shell am force-stop com.google.android.apps.chrome
}

trap "killChromium; exit 0" EXIT

echo -e "\n\n\n----------------+ `date` +----------------\n" >> $LOG_FILE


# http://developer.android.com/tools/devices/emulator.html#emulatornetworking
captureUrl=$1
chromiumExec ${captureUrl/localhost/10.0.2.2}
