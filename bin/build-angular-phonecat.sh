#!/bin/bash

# Enable tracing and exit on first failure
set -xe


# Define reasonable set of browsers in case we are running manually from commandline
if [[ -z "$BROWSERS" ]]
then
  BROWSERS="Chrome,Firefox,Opera,/Users/jenkins/bin/safari.sh,/Users/jenkins/bin/ie8.sh,/Users/jenkins/bin/ie9.sh"
fi

if [[ -z "$BROWSERS_E2E" ]]
then
  BROWSERS_E2E="Chrome,Firefox,/Users/jenkins/bin/safari.sh"
fi

npm install .

./scripts/web-server.js > /dev/null &
WEBSERVER_PID=$!

trap "{ kill $WEBSERVER_PID; exit; }" EXIT

for i in {3..12}; do

  STEP="step-$i"

  git checkout -f $STEP

  ./scripts/test.sh \
      --browsers="$BROWSERS" \
      --reporters=dots \
      --single-run \
      --no-colors

  ./scripts/e2e-test.sh \
      --browsers="$BROWSERS_E2E" \
      --reporters=dots \
      --no-colors

done
