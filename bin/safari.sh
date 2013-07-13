#!/bin/bash

# cleanup
killall Safari
rm -rf ~/Library/Saved\ Application\ State/com.apple.Safari.savedState/
rm -rf ~/Library/Caches/com.apple.Safari

# register a trap
trap "{ killall Safari; exit 0; }" EXIT

# start safari
open -a Safari -W $1
