#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
npm install --color false
grunt configure --target=prod
bower install --production
chmod 777 `pwd`/components/chromedriver_mac_26.0.1383.0/chromedrive

# E2E TESTS #
grunt ht2j
./node_modules/.bin/protractor protractorConf.js

