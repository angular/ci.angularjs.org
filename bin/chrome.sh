#!/bin/bash

cleanup() {
  killall "Google Chrome"
  sleep 5
  rm ~/Library/Application\ Support/Google/Chrome/Default/Current\ Session
  rm ~/Library/Application\ Support/Google/Chrome/Default/Current\ Tabs
  #rm ~/Library/Application\ Support/Google/Chrome/SingletonLock
}

# register a trap
trap "cleanup; exit 0" EXIT

# start
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome $1 >> /Users/jenkins/bin/chrome.log 2>&1
