#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
salixlive-installer
-------------------
- add a Salix Live Installer icon in the user 'one' desktop.


EOF

SALIXLIVEINSTALLER="$(readlink -f "$(ls -1 "$HDIR"/../PKGS/salix-live-installer-*.txz 2>/dev/null)")"
if [ -n "$SALIXLIVEINSTALLER" ]; then
  tar xf "$SALIXLIVEINSTALLER" usr/share/applications
  mkdir -p "$RDIR"/home/one/Desktop
  cp usr/share/applications/*.desktop "$RDIR"/home/one/Desktop/
  rm -rf usr
else
  echo "Cannot add $0 because package salix-live-installer is missing in PKGS." >&2
  exit 1
fi
