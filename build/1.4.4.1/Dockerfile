FROM debian:wheezy
MAINTAINER ByS Control "info@bys-control.com.ar"

RUN apt-get update -y && \
apt-get install -y curl bzip2 build-essential python procps

RUN curl -sL https://install.meteor.com | sed s/RELEASE=\"\.*\"/RELEASE=\"'1.4.4.1'\"/g | /bin/sh 
ENV METEOR_ALLOW_SUPERUSER true

ENV METEORD_DIR /opt/meteord
COPY build_app.sh $METEORD_DIR/

ENTRYPOINT bash $METEORD_DIR/build_app.sh