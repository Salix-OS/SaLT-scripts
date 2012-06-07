#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
gmountman
---------
- add a GMountMan icon in the user 'one' desktop.


EOF

GMOUNTMAN="$(readlink -f "$(ls -1 "$HDIR"/../PKGS/gmountman-*.txz 2>/dev/null)")"
if [ -n "$GMOUNTMAN" ]; then
  tar xf "$GMOUNTMAN" usr/share/applications
  mkdir -p "$RDIR"/home/one/Desktop
  cp usr/share/applications/*.desktop "$RDIR"/home/one/Desktop/
  rm -rf usr
else
  echo "Cannot add $0 because package gmountman is missing in PKGS." >&2
  exit 1
fi
