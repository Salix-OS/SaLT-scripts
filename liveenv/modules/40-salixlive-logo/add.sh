#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
salixlive-logo
--------------
- Add a logo for Salix Live


EOF

mkdir -p "$RDIR"/usr/share/icons/hicolor/128x128/apps/
cp salixlive-logo.png "$RDIR"/usr/share/icons/hicolor/128x128/apps/
