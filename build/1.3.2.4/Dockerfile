FROM debian:wheezy
MAINTAINER ByS Control "info@bys-control.com.ar"

RUN apt-get update -y && \
apt-get install -y curl bzip2 build-essential python procps

RUN curl -sL https://install.meteor.com | sed s/RELEASE=\"\.*\"/RELEASE=\"'1.3.2.4'\"/g | /bin/sh 

ONBUILD ADD . /app
ONBUILD RUN cd /app && \
rm -rf .meteor/local && \
meteor npm i --production && \
meteor build --directory /tmp --server=http://localhost:3000 && \
cd /tmp/bundle/programs/server/ && \
meteor npm i && \
mv /tmp/bundle /built_app && \
echo "=> App built successfully! App files located at /built_app"
