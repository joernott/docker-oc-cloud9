#!/bin/bash
set -e
set -x

chmod a+rwx /tmp
curl -sSo /tmp/install/functions.sh https://raw.githubusercontent.com/joernott/docker-oc-install-library/master/install_functions.sh
source /tmp/install/functions.sh

install_software git glibc-static gcc make
create_user_and_group
git clone https://github.com/c9/core.git /cloud9
cd /cloud9
./scripts/install-sdk.sh
sed -e 's/127\.0\.0\.1/0.0.0.0/' -i /cloud9/configs/standalone.js

curl -sSo /tmp/install/cloud9_ssh_install.sh https://raw.githubusercontent.com/c9/install/master/install.sh
chmod a+x /tmp/install/cloud9_ssh_install.sh
cd ${APP_HOME}
gosu ${APP_USER}:${APP_GROUP} /tmp/install/cloud9_ssh_install.sh

cleanup

