FROM byscontrol/meteord:base
MAINTAINER ByS Control "info@bys-control.com.ar"

COPY scripts $METEORD_DIR
ONBUILD ARG CDN_SERVER=''
ONBUILD ARG METEOR_RELEASE=''
ONBUILD COPY ./ /app
ONBUILD RUN CDN_SERVER=$CDN_SERVER RELEASE=$METEOR_RELEASE bash $METEORD_DIR/on_build.sh