#!/bin/sh
# vim: set syn=sh ft=sh et sw=2 sts=2 ts=2 tw=0:
# Maintainer: JRD <jrd@salixos.org>
# Contributors: Shador <shador@salixos.org>, Akuna <akuna@salixos.org>
# Licence: GPL v3+
#
# Used to rebuild the initrd of the live ISO. Usefull only in developping phase.

cd "$(dirname "$0")"
. scripts/00_common
echo3 "Re-building initrd for $DISTRO live v.$VER"
. scripts/07_prepareiso
. scripts/09_createiso
. scripts/10_createextrainitrd
