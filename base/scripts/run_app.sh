set -e

# Honour already existing PORT setup
export PORT=${PORT:-80}

if [ -d /bundle ]; then
  cd /bundle
  tar xzf *.tar.gz
  cd /bundle/bundle/programs/server/
  npm i
  cd /bundle/bundle/
elif [[ $BUNDLE_URL ]]; then
  cd /tmp
  curl -L -o bundle.tar.gz $BUNDLE_URL
  tar xzf bundle.tar.gz
  cd /tmp/bundle/programs/server/
  npm i
  cd /tmp/bundle/
elif [ -d /built_app ]; then
  cd /built_app
elif [[ $DEVELOPMENT ]]; then
  cd /app
  echo "=> Installing npm dependencies"
  meteor npm i
  echo "=> Starting meteor app in DEVELOPMENT MODE on port:$PORT"
  if [[ $METEOR_SETTINGS_FILE ]]; then
    meteor -p ${PORT} --settings ${METEOR_SETTINGS_FILE}
  else
    meteor -p ${PORT}
  fi
  exit 1
else
  echo "=> You don't have an meteor app to run in this image."
  exit 1
fi

if [[ $REBUILD_NPM_MODULES ]]; then
  if [ -f /opt/meteord/rebuild_npm_modules.sh ]; then
    cd programs/server
    bash /opt/meteord/rebuild_npm_modules.sh
    cd ../../
  else
    echo "=> Use meteorhacks/meteord:bin-build for binary bulding."
    exit 1
  fi
fi

# Set a delay to wait to start meteor container
if [[ $DELAY ]]; then
  echo "Delaying startup for $DELAY seconds"
  sleep $DELAY
fi

echo "=> Starting meteor app on port:$PORT"
if [[ $METEOR_SETTINGS_FILE ]]; then
  export METEOR_SETTINGS=$(cat /app/$METEOR_SETTINGS_FILE)
fi
node main.js