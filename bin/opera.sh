#!/bin/bash
trap "{ killall Opera;  rm -rf ~/Library/Opera/; exit 0; }" EXIT
/Applications/Opera.app/Contents/MacOS/Opera $1
