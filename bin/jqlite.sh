#!/bin/sh
sed -i '' -e 's/" name="/" name="jqlite: /g' ./test_out/jqlite/*.xml
echo renamed to jqlite
