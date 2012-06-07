#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
echo "$HDIR"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
salix-startup-guide
-------------------
- add a Salix Startup Guide icon in the user 'one' desktop.


EOF

SALIXSTARTUPGUIDE="$(readlink -f "$(ls -1 "$HDIR"/../PKGS/salix-startup-guide-*.txz 2>/dev/null)")"
if [ -n "$SALIXSTARTUPGUIDE" ]; then
  tar xf "$SALIXSTARTUPGUIDE" usr/share/applications
  mkdir -p "$RDIR"/home/one/Desktop
  cp usr/share/applications/*.desktop "$RDIR"/home/one/Desktop/
  rm -rf usr
else
  echo "Cannot add $0 because package salix-startup-guide is missing in PKGS." >&2
  exit 1
fi
