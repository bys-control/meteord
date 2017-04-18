FROM debian:wheezy
MAINTAINER ByS Control "info@bys-control.com.ar"

RUN apt-get update -y && \
apt-get install -y --no-install-recommends curl ca-certificates

RUN curl -sL https://install.meteor.com | sed s/RELEASE=\"\.*\"/RELEASE=\"'1.4.4.1'\"/g | /bin/sh 
ENV METEOR_ALLOW_SUPERUSER true

EXPOSE 3000

ONBUILD ADD . /app
ONBUILD RUN cp -R /app /copied-app && cd /copied-app && \
meteor npm i --production && \
meteor build --directory /tmp/bundle-dir --server=http://localhost:3000 && \
cd /tmp/bundle-dir/bundle/programs/server/ && \
meteor npm i && \
tar --remove-files -cvzf /bundle.tgz /tmp/bundle-dir/bundle && \
rm -rf /copied-app && \
rm -rf /tmp/bundle-dir