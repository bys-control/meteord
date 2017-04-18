#!/bin/bash
set -e

# Honour already existing PORT setup
export PORT=${PORT:-80}

if [ -d /built_app ]; then
  cd /built_app
else
  echo "=> You don't have an meteor app to run in this image."
  exit 1
fi

# Set a delay to wait to start meteor container
if [[ $DELAY ]]; then
  echo "Delaying startup for $DELAY seconds"
  sleep $DELAY
fi

echo "=> Starting meteor app on port:$PORT"
if [[ -e settings.json ]]; then
  export METEOR_SETTINGS=$(<settings.json)
fi
node main.js