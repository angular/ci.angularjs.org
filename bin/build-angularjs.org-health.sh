#!/bin/bash

# Enable tracing and exit on first failure
set -xe

# BUILD #
npm install --color false

grunt test