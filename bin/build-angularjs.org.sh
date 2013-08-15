#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
npm install --color false
grunt configure --target=prod
bower install --production

# E2E TESTS #
grunt ht2j
./node_modules/.bin/protractor protractorConf.js

