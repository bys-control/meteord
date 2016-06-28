FROM byscontrol/meteord:base
MAINTAINER ByS Control "info@bys-control.com.ar"

ONBUILD COPY ./ /app
ONBUILD ARG METEOR_RELEASE
ONBUILD RUN METEOR_RELEASE=$METEOR_RELEASE bash $METEORD_DIR/on_build.sh