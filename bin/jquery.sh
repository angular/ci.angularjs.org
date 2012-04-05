#!/bin/sh
sed -i '' -e 's/" name="/" name="jquery: /g' ./test_out/jquery/*.xml
echo renamed to jquery
