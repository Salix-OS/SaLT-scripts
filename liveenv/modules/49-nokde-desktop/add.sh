#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
nokde-desktop
-------------
- remove all *-kde.desktop files in the user 'one' desktop. Some DE will display them even in OnlyShownIn=KDE is specified.


EOF

rm -f "$RDIR"/root/home/one/Desktop/*-kde.desktop 2>/dev/null
