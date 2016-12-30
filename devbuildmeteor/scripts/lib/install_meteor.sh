set -e

if [[ $METEOR_RELEASE ]]; then
	curl -sL https://install.meteor.com | sed s/RELEASE=\"\.*\"/RELEASE=\"'$METEOR_RELEASE'\"/g | sed s/--progress-bar/-sL/g | /bin/sh
else
	curl -sL https://install.meteor.com | sed s/--progress-bar/-sL/g | /bin/sh
fi