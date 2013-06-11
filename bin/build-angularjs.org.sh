#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
bower install --save https://selenium.googlecode.com/files/selenium-server-standalone-2.33.0.jar
bower install --save https://chromedriver.googlecode.com/files/chromedriver_mac_26.0.1383.0.zip
npm install --color false
grunt configure --target=prod


# E2E TESTS #
grunt ht2j
grunt test
