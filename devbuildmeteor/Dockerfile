FROM byscontrol/meteord:base
MAINTAINER ByS Control "info@bys-control.com.ar"

ARG METEOR_RELEASE=1.3.4

ADD install_meteor_release.sh /opt/meteord/lib/
RUN METEOR_RELEASE=$METEOR_RELEASE bash $METEORD_DIR/lib/install_meteor_release.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/lib/build_app.sh