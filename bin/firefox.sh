#!/bin/bash

# cleanup
killall -9 firefox
rm -rf ~/Library/Application\ Support/Firefox/Profiles/w9fd2jwf.default/sessionstore.*
rm -f ~/Library/Application\ Support/Firefox/Profiles/w9fd2jwf.default/.parentlock

# register a trap
trap "{ killall firefox; exit 0; }" EXIT

/Applications/Firefox.app/Contents/MacOS/firefox $*
