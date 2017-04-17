FROM debian:wheezy
MAINTAINER ByS Control "info@bys-control.com.ar"

ENV METEORD_DIR /opt/meteord
COPY scripts $METEORD_DIR

ONBUILD ADD . /built_app
ONBUILD RUN bash $METEORD_DIR/init.sh

EXPOSE 80
ENTRYPOINT bash $METEORD_DIR/run_app.sh
