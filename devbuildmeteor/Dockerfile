FROM byscontrol/meteord:base
MAINTAINER ByS Control "info@bys-control.com.ar"

RUN bash $METEORD_DIR/lib/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD ARG DEVELOPMENT=''
ONBUILD RUN DEVELOPMENT=$DEVELOPMENT bash $METEORD_DIR/lib/build_app.sh