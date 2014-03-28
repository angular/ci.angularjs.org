#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
npm install --color false
grunt configure --target=prod --no-color

# E2E TESTS #
grunt ht2j --no-color
./test.sh
