#!/bin/sh
# vim: set syn=sh ft=sh et sw=2 sts=2 ts=2 tw=0:
#
# Used to download the correct version of SaLT.

cd $(dirname "$0")
SALT_VER='master'
SALT_URL='git://github.com/jrd/SaLT.git'
if [ -d salt ]; then
  rm -rf salt || echo "salt directory cannot be removed, check permissions" >&2
fi
# Get the repo from git without checking-out any branch.
git clone -n "$SALT_URL" salt
cd salt
# Getting the commit referenced by the tag.
git checkout "$SALT_VER"
# Removing the git handling of the directory.
rm -rf .git
