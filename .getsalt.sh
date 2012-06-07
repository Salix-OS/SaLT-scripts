#!/bin/sh
#
# Used to download the correct version of SaLT.

cd "$(dirname "$0")"
SALT_VER='0.1.1'
SALT_URL="https://salix.svn.sourceforge.net/svnroot/salix/salt/tags/$SALT_VER"
if [ -d salt ]; then
  rm -rf salt || echo "salt directory cannot be removed, check permissions" >&2
fi
svn export "$SALT_URL" salt
