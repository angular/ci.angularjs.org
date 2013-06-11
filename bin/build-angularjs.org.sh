#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
bower install
npm install --color false
grunt configure --target=prod


# E2E TESTS #
grunt ht2j
grunt test
