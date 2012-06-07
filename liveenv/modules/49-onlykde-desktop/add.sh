#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
onlykde-desktop
---------------
- rename all *-kde.desktop files in the user 'one' desktop by removing the '-kde' part and overwritting duplicate desktop files.


EOF

(
  cd "$RDIR"/root/home/one/Desktop
  for f in *-kde.desktop; do
    mv $f $(echo "$f"|sed 's/-kde//')
  done
)
