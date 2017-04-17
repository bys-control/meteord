#!/bin/bash
set -e

NODE_VERSION=$(</built_app/bundle/.node_version.txt)
NODE_ARCH=x64
NODE_DIST=node-${NODE_VERSION}-linux-${NODE_ARCH}

cd /tmp
curl -O -L https://nodejs.org/dist/${NODE_VERSION}/${NODE_DIST}.tar.gz
tar xvzf ${NODE_DIST}.tar.gz
rm -rf /opt/nodejs
mv ${NODE_DIST} /opt/nodejs

ln -sf /opt/nodejs/bin/node /usr/bin/node
ln -sf /opt/nodejs/bin/npm /usr/bin/npm
