#!/bin/sh
# vim: set syn=sh et ai sw=2 st=2 ts=2 tw=0:
# Maintainer: JRD <jrd@salixos.org>
# Contributors: Shador <shador@salixos.org>, Akuna <akuna@salixos.org>
# Licence: GPL v3+
#
# Used to build the live ISO
# SaLT is used to build this Live CD.
# funionfs (unionfs with fuse) is still used for building the modules because it is simpler and easier than aufs which may not be compiled in your kernel and which is not available in FUSE. The 0.4.2 version is used in time of writing, instead of 0.4.3 because this one is buggy. Later versions must be checked to see if it's ok with "cp" and "mkfifo" for example.
#
# See README

cd $(dirname "$0")
rm -f build-iso.log
log() {
  sed "s/^/[$(date '+%F %T')] /" | tee -a build-iso.log
}
. scripts/00_common 2>&1 | log
echo3 "Building $DISTRO live v.$VER" 2>&1 | log
. scripts/01_getfunionfs 2>&1 | log
. scripts/02_liveenv 2>&1 | log
. scripts/03_readmodules 2>&1 | log
. scripts/04_checkmodules 2>&1 | log
[ -e src ] && rm -rf src 2>&1 | log
. scripts/05_preparesources 2>&1 | log
. scripts/06_createmodule 2>&1 | log
. scripts/07_prepareiso 2>&1 | log
. scripts/08_compressmodule 2>&1 | log
rm -f $modules 2>&1 | log
. scripts/09_createiso 2>&1 | log
. scripts/10_createextrainitrd 2>&1 | log
