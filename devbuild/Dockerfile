FROM byscontrol/meteord:base
MAINTAINER ByS Control "info@bys-control.com.ar"

ONBUILD RUN bash $METEORD_DIR/lib/install_meteor.sh
ONBUILD COPY ./ /app
ONBUILD RUN bash $METEORD_DIR/lib/build_app.sh