#!/bin/sh
cd "$(dirname "$0")"
HDIR="$(readlink -f "$PWD"/../..)"
echo "$HDIR"
RDIR="$HDIR"/root
doinst="$HDIR"/doinst
modtxt="$HDIR"/MODIFICATIONS

cat <<EOF >> "$modtxt"
dmrc-xfce
---------
- default session for user 'one' is Xfce


EOF

cat <<EOF > "$RDIR"/home/one/.dmrc
[Desktop]
Session=xfce

EOF
