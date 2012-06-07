#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
echo "$HDIR"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
openoffice-profile
-----------------
- Create a OpenOffice profile, because former-Sun was asking a lot of question on first run. Could be useless with ApacheOpenOffice and IS useless with libreoffice.


EOF

tar -C "$RDIR"/home/one -xf openoffice-profile.tar.xz
