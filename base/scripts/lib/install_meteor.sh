set -e

cat $METEORD_DIR/lib/install_meteor_release.sh | sed s/--progress-bar/-sL/g | /bin/bash
