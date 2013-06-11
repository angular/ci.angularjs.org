#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
bower install
chmod 777 `pwd`/components/chromedriver_mac_26.0.1383.0/chromedriver
npm install --color false
grunt configure --target=prod


# E2E TESTS #
grunt ht2j
grunt test
