#!/bin/bash

# Enable tracing and exit on first failure
set -xe


# Define reasonable set of browsers in case we are running manually from commandline
if [[ -z "$BROWSERS" ]]
then
  BROWSERS="Chrome,Firefox,Opera,/Users/jenkins/bin/safari.sh,/Users/jenkins/bin/ie8.sh,/Users/jenkins/bin/ie9.sh"
fi


rm -rf test_out

npm install .

./scripts/test.sh \
  --single-run \
  --browsers="$BROWSERS" \
  --reporters="dots,junit" \
  --no-colors


./scripts/web-server.js > /dev/null &
WEBSERVER_PID=$!

trap "{ kill $WEBSERVER_PID; exit; }" EXIT

./scripts/e2e-test.sh \
  --single-run \
  --browsers="$BROWSERS" \
  --reporters="dots,junit" \
  --no-colors
