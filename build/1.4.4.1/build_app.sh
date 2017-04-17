set -e

COPIED_APP_PATH=/copied-app
BUNDLE_DIR=/tmp/bundle-dir
# sometimes, directly copied folder cause some wierd issues
# this fixes that
cp -R /app $COPIED_APP_PATH
cd $COPIED_APP_PATH

meteor npm i --production
meteor build --directory $BUNDLE_DIR --server=http://localhost:3000

cd $BUNDLE_DIR/bundle/programs/server/
meteor npm i

mv $BUNDLE_DIR/bundle /built_app

# cleanup
rm -rf $COPIED_APP_PATH
rm -rf $BUNDLE_DIR