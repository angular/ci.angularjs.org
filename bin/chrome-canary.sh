#!/bin/bash

cleanup() {
  killall "Google Chrome Canary"
  sleep 5
  rm ~/Library/Application\ Support/Google/Chrome\ Canary/Default/Current\ Session
  rm ~/Library/Application\ Support/Google/Chrome\ Canary/Default/Current\ Tabs
  #rm ~/Library/Application\ Support/Google/Chrome\ Canary/SingletonLock
}

# register a trap
trap "cleanup; exit 0" EXIT

# start
/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary $1 >> /Users/jenkins/bin/chrome-canary.log 2>&1
